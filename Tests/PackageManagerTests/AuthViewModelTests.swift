import XCTest
@testable import PackageManager

final class AuthViewModelTests: XCTestCase {
    func testRegisterAndLogin() {
        let viewModel = AuthViewModel()
        XCTAssertTrue(viewModel.register(email: "test@example.com", password: "password"))
        XCTAssertTrue(viewModel.isAuthenticated)
        viewModel.logout()
        XCTAssertFalse(viewModel.isAuthenticated)
        XCTAssertTrue(viewModel.login(email: "test@example.com", password: "password"))
        XCTAssertTrue(viewModel.isAuthenticated)
        XCTAssertFalse(viewModel.login(email: "test@example.com", password: "wrong"))
    }
    func testDuplicateRegistrationFails() {
        let viewModel = AuthViewModel()
        XCTAssertTrue(viewModel.register(email: "a@b.com", password: "pw"))
        XCTAssertFalse(viewModel.register(email: "a@b.com", password: "pw2"))
    }
}
