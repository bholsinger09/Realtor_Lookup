import XCTest
@testable import PackageManager

final class PropertyViewModelTests: XCTestCase {
    func testFormattedPrice() {
        let property = Property(address: "123 Main St", price: 350000, bedrooms: 3, bathrooms: 2, squareFeet: 1800, description: "Great home!")
        let viewModel = PropertyViewModel(property: property)
        XCTAssertTrue(viewModel.formattedPrice.contains("350,000"))
    }
}
