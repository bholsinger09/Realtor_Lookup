import SwiftUI

#Preview {
    let sampleProperties = [
        Property(address: "123 Main St", price: 350000, bedrooms: 3, bathrooms: 2, squareFeet: 1800, description: "Great home!"),
        Property(address: "456 Oak Ave", price: 450000, bedrooms: 4, bathrooms: 3, squareFeet: 2200, description: "Spacious and modern.")
    ]
    let viewModel = PropertyListViewModel(properties: sampleProperties)
    return NavigationView {
        PropertyListView(viewModel: viewModel)
    }
}
