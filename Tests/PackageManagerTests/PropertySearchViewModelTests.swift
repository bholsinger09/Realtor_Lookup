import XCTest
@testable import PackageManager

final class PropertySearchViewModelTests: XCTestCase {
    let properties = [
        Property(address: "123 Main St", price: 350000, bedrooms: 3, bathrooms: 2, squareFeet: 1800, description: "Great home!"),
        Property(address: "456 Oak Ave", price: 450000, bedrooms: 4, bathrooms: 3, squareFeet: 2200, description: "Spacious and modern."),
        Property(address: "789 Pine Rd", price: 250000, bedrooms: 2, bathrooms: 1, squareFeet: 1200, description: "Cozy starter.")
    ]
    func testSearchByAddress() {
        let viewModel = PropertySearchViewModel(properties: properties)
        viewModel.search(address: "Oak")
        XCTAssertEqual(viewModel.filteredProperties.count, 1)
        XCTAssertEqual(viewModel.filteredProperties.first?.address, "456 Oak Ave")
    }
    func testSearchByMinPrice() {
        let viewModel = PropertySearchViewModel(properties: properties)
        viewModel.search(minPrice: 400000)
        XCTAssertEqual(viewModel.filteredProperties.count, 1)
        XCTAssertEqual(viewModel.filteredProperties.first?.address, "456 Oak Ave")
    }
    func testSearchByBedrooms() {
        let viewModel = PropertySearchViewModel(properties: properties)
        viewModel.search(minBedrooms: 3)
        XCTAssertEqual(viewModel.filteredProperties.count, 2)
    }
}
