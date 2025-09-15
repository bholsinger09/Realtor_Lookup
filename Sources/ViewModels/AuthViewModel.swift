import Foundation

public class AuthViewModel: ObservableObject {
    @Published public private(set) var currentUser: AuthUser?
    @Published public private(set) var isAuthenticated: Bool = false
    private var users: [AuthUser] = []
    
    public init(users: [AuthUser] = []) {
        self.users = users
    }
    
    public func register(email: String, password: String) -> Bool {
        guard !users.contains(where: { $0.email == email }) else { return false }
        let user = AuthUser(email: email, password: password)
        users.append(user)
        currentUser = user
        isAuthenticated = true
        return true
    }
    
    public func login(email: String, password: String) -> Bool {
        guard let user = users.first(where: { $0.email == email && $0.password == password }) else {
            isAuthenticated = false
            return false
        }
        currentUser = user
        isAuthenticated = true
        return true
    }
    
    public func logout() {
        currentUser = nil
        isAuthenticated = false
    }
}
