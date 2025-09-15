import XCTest
@testable import PackageManager

final class PropertyListViewModelTests: XCTestCase {
    func testAddAndRemoveProperty() {
    let property1 = Property(address: "123 Main St", zipCode: "90210", price: 350000, bedrooms: 3, bathrooms: 2, squareFeet: 1800, description: "Great home!", status: .forSale)
    let property2 = Property(address: "456 Oak Ave", zipCode: "90210", price: 450000, bedrooms: 4, bathrooms: 3, squareFeet: 2200, description: "Spacious and modern.", status: .forSale)
        let viewModel = PropertyListViewModel()
        viewModel.addProperty(property1)
        viewModel.addProperty(property2)
    XCTAssertEqual(viewModel.filteredProperties.count, 2)
    viewModel.removeProperty(property1)
    XCTAssertEqual(viewModel.filteredProperties.count, 1)
    XCTAssertEqual(viewModel.filteredProperties.first, property2)
    }
}
