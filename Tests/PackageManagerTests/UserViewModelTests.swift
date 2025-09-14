import XCTest
@testable import PackageManager

final class UserViewModelTests: XCTestCase {
    func testUserFullName() {
        let user = User(firstName: "Jane", lastName: "Doe")
        let viewModel = UserViewModel(user: user)
        XCTAssertEqual(viewModel.fullName, "Jane Doe")
    }
}
