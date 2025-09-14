import Foundation

public class PropertyListViewModel: ObservableObject {
    @Published public private(set) var properties: [Property]
    public init(properties: [Property] = []) {
        self.properties = properties
    }
    public func addProperty(_ property: Property) {
        properties.append(property)
    }
    public func removeProperty(_ property: Property) {
        properties.removeAll { $0.id == property.id }
    }
}
