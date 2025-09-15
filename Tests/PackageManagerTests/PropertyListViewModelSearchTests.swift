import XCTest
@testable import PackageManager

final class PropertyListViewModelSearchTests: XCTestCase {
    let properties = [
        Property(address: "123 Main St", zipCode: "90210", price: 350000, bedrooms: 3, bathrooms: 2, squareFeet: 1800, description: "Great home!", status: .forSale),
        Property(address: "456 Oak Ave", zipCode: "90210", price: 450000, bedrooms: 4, bathrooms: 3, squareFeet: 2200, description: "Spacious and modern.", status: .sold),
        Property(address: "789 Pine Rd", zipCode: "10001", price: 250000, bedrooms: 2, bathrooms: 1, squareFeet: 1200, description: "Cozy starter.", status: .forSale)
    ]
    func testZipCodeSearchFiltersForSale() {
        let viewModel = PropertyListViewModel(properties: properties)
        viewModel.searchZip = "90210"
        XCTAssertEqual(viewModel.filteredProperties.count, 1)
        XCTAssertEqual(viewModel.filteredProperties.first?.address, "123 Main St")
        viewModel.searchZip = "10001"
        XCTAssertEqual(viewModel.filteredProperties.count, 1)
        XCTAssertEqual(viewModel.filteredProperties.first?.address, "789 Pine Rd")
        viewModel.searchZip = ""
        XCTAssertEqual(viewModel.filteredProperties.count, 2) // Only forSale
    }
}
