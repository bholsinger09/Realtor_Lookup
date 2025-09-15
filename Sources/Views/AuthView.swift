import SwiftUI
import PackageManager

public struct AuthView: View {
    @ObservedObject public var viewModel: AuthViewModel
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isRegistering: Bool = false
    @State private var errorMessage: String?
    
    public init(viewModel: AuthViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        VStack(spacing: 20) {
            Text(isRegistering ? "Register" : "Login")
                .font(.largeTitle)
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            if let error = errorMessage {
                Text(error)
                    .foregroundColor(.red)
            }
            Button(isRegistering ? "Register" : "Login") {
                if isRegistering {
                    if !viewModel.register(email: email, password: password) {
                        errorMessage = "Email already registered."
                    } else {
                        errorMessage = nil
                    }
                } else {
                    if !viewModel.login(email: email, password: password) {
                        errorMessage = "Invalid credentials."
                    } else {
                        errorMessage = nil
                    }
                }
            }
            .padding()
            Button(isRegistering ? "Have an account? Login" : "No account? Register") {
                isRegistering.toggle()
                errorMessage = nil
            }
            .font(.footnote)
        }
        .padding()
    }
}
