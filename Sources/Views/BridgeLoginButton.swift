import SwiftUI

public struct BridgeLoginButton: View {
    @State private var showingWebAuth = false
    @State private var accessToken: String?
    public var onLogin: ((String) -> Void)?
    public init(onLogin: ((String) -> Void)? = nil) {
        self.onLogin = onLogin
    }
    public var body: some View {
        VStack {
            Button("Login with MLS (Bridge)") {
                showingWebAuth = true
            }
            if let token = accessToken {
                Text("Access Token: \(token.prefix(8))...")
                    .font(.footnote)
            }
        }
        .sheet(isPresented: $showingWebAuth) {
            if let url = BridgeOAuthService.shared.authUrl {
                BridgeWebAuthView(authUrl: url) { token in
                    accessToken = token
                    onLogin?(token)
                }
            } else {
                Text("Unable to start login.")
            }
        }
    }
}

struct BridgeWebAuthView: View {
    let authUrl: URL
    var onToken: (String) -> Void
    @Environment(\.presentationMode) var presentationMode
    @State private var webViewNavigationPublisher = WebView.NavigationPublisher()
    var body: some View {
        WebView(url: authUrl, navigationPublisher: webViewNavigationPublisher)
            .onReceive(webViewNavigationPublisher.publisher) { url in
                // Check if URL matches your redirect URI and contains code
                if let code = extractAuthCode(from: url) {
                    BridgeOAuthService.shared.exchangeCodeForToken(authCode: code) { token in
                        if let token = token {
                            DispatchQueue.main.async {
                                onToken(token)
                                presentationMode.wrappedValue.dismiss()
                            }
                        }
                    }
                }
            }
    }
    func extractAuthCode(from url: URL) -> String? {
        // Example: yourapp://redirect?code=AUTH_CODE
        guard url.absoluteString.starts(with: BridgeOAuthService.shared.redirectUri),
              let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
              let code = components.queryItems?.first(where: { $0.name == "code" })?.value else {
            return nil
        }
        return code
    }
}

// Simple WebView wrapper for SwiftUI (macOS 11+) with navigation publisher
import WebKit
struct WebView: NSViewRepresentable {
    let url: URL
    let navigationPublisher: NavigationPublisher?
    func makeNSView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        webView.load(URLRequest(url: url))
        return webView
    }
    func updateNSView(_ nsView: WKWebView, context: Context) {}
    func makeCoordinator() -> Coordinator {
        Coordinator(navigationPublisher: navigationPublisher)
    }
    class Coordinator: NSObject, WKNavigationDelegate {
        let navigationPublisher: NavigationPublisher?
        init(navigationPublisher: NavigationPublisher?) {
            self.navigationPublisher = navigationPublisher
        }
        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            if let url = navigationAction.request.url {
                navigationPublisher?.publisher.send(url)
            }
            decisionHandler(.allow)
        }
    }
    class NavigationPublisher {
        let publisher = PassthroughSubject<URL, Never>()
    }
}
import Combine
