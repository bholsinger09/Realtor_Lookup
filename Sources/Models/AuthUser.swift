import Foundation

public struct AuthUser: Equatable, Codable {
    public let id: UUID
    public let email: String
    public let password: String // In production, never store plain passwords!
    public init(id: UUID = UUID(), email: String, password: String) {
        self.id = id
        self.email = email
        self.password = password
    }
}
