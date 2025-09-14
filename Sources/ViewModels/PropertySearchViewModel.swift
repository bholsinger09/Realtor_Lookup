import Foundation

public class PropertySearchViewModel: ObservableObject {
    @Published public private(set) var filteredProperties: [Property] = []
    private let allProperties: [Property]
    public init(properties: [Property]) {
        self.allProperties = properties
        self.filteredProperties = properties
    }
    public func search(address: String? = nil, minPrice: Double? = nil, maxPrice: Double? = nil, minBedrooms: Int? = nil) {
        filteredProperties = allProperties.filter { property in
            let matchesAddress = address == nil || property.address.localizedCaseInsensitiveContains(address!)
            let matchesMinPrice = minPrice == nil || property.price >= minPrice!
            let matchesMaxPrice = maxPrice == nil || property.price <= maxPrice!
            let matchesMinBedrooms = minBedrooms == nil || property.bedrooms >= minBedrooms!
            return matchesAddress && matchesMinPrice && matchesMaxPrice && matchesMinBedrooms
        }
    }
}
