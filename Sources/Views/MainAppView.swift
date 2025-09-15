import SwiftUI
import PackageManager

public struct MainAppView: View {
    @StateObject private var authViewModel = AuthViewModel()
    @StateObject private var propertyListViewModel = PropertyListViewModel()
    
    public init() {}
    
    public var body: some View {
        Group {
            if authViewModel.isAuthenticated {
                NavigationView {
                    VStack {
                        PropertyListView(viewModel: propertyListViewModel)
                        Button("Logout") {
                            authViewModel.logout()
                        }
                        .padding()
                    }
                }
            } else {
                AuthView(viewModel: authViewModel)
            }
        }
    }
}
