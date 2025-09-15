import SwiftUI

#Preview {
    let sampleProperties = [
        Property(address: "123 Main St", zipCode: "90210", price: 350000, bedrooms: 3, bathrooms: 2, squareFeet: 1800, description: "Great home!", status: .forSale),
        Property(address: "456 Oak Ave", zipCode: "90210", price: 450000, bedrooms: 4, bathrooms: 3, squareFeet: 2200, description: "Spacious and modern.", status: .forSale)
    ]
    let viewModel = PropertyListViewModel(properties: sampleProperties)
    NavigationView {
        PropertyListView(viewModel: viewModel)
    }
}
