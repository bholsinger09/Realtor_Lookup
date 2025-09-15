import Foundation

public class PropertyListViewModel: ObservableObject {
    @Published public private(set) var allProperties: [Property]
    @Published public var filteredProperties: [Property]
    @Published public var searchZip: String = "" {
        didSet { filterProperties() }
    }
    public init(properties: [Property] = []) {
        self.allProperties = properties
        self.filteredProperties = properties
    }
    public func addProperty(_ property: Property) {
        allProperties.append(property)
        filterProperties()
    }
    public func removeProperty(_ property: Property) {
        allProperties.removeAll { $0.id == property.id }
        filterProperties()
    }
    public func filterProperties() {
        filteredProperties = allProperties.filter { property in
            (searchZip.isEmpty || property.zipCode.contains(searchZip)) && property.status == .forSale
        }
    }
}
