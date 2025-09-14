import Foundation

public class UserViewModel: ObservableObject {
    private let user: User
    public var fullName: String {
        "\(user.firstName) \(user.lastName)"
    }
    public init(user: User) {
        self.user = user
    }
}
