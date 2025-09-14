import XCTest
@testable import PackageManager

final class PropertyListViewModelTests: XCTestCase {
    func testAddAndRemoveProperty() {
        let property1 = Property(address: "123 Main St", price: 350000, bedrooms: 3, bathrooms: 2, squareFeet: 1800, description: "Great home!")
        let property2 = Property(address: "456 Oak Ave", price: 450000, bedrooms: 4, bathrooms: 3, squareFeet: 2200, description: "Spacious and modern.")
        let viewModel = PropertyListViewModel()
        viewModel.addProperty(property1)
        viewModel.addProperty(property2)
        XCTAssertEqual(viewModel.properties.count, 2)
        viewModel.removeProperty(property1)
        XCTAssertEqual(viewModel.properties.count, 1)
        XCTAssertEqual(viewModel.properties.first, property2)
    }
}
