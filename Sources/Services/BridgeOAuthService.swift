import Foundation

public class BridgeOAuthService {
    public static let shared = BridgeOAuthService()
    private init() {}
    
    // Set these with your app's credentials
    private let clientId = "YOUR_CLIENT_ID"
    private let clientSecret = "YOUR_CLIENT_SECRET"
    private let redirectUri = "YOUR_REDIRECT_URI"
    
    public var authUrl: URL? {
        let urlString = "https://auth.bridgeinteractive.com/oauth/authorize?response_type=code&client_id=\(clientId)&redirect_uri=\(redirectUri)&scope=openid"
        return URL(string: urlString)
    }
    
    public func exchangeCodeForToken(authCode: String, completion: @escaping (String?) -> Void) {
        guard let tokenUrl = URL(string: "https://auth.bridgeinteractive.com/oauth/token") else {
            completion(nil)
            return
        }
        var request = URLRequest(url: tokenUrl)
        request.httpMethod = "POST"
        let params = [
            "grant_type": "authorization_code",
            "code": authCode,
            "redirect_uri": redirectUri,
            "client_id": clientId,
            "client_secret": clientSecret
        ]
        request.httpBody = params
            .map { "\($0.key)=\($0.value)" }
            .joined(separator: "&")
            .data(using: .utf8)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data,
                  let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                  let accessToken = json["access_token"] as? String else {
                completion(nil)
                return
            }
            completion(accessToken)
        }.resume()
    }
}
