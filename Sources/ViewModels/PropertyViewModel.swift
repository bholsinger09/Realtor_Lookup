import Foundation

public class PropertyViewModel: ObservableObject {
    @Published public var property: Property
    public var formattedPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(value: property.price)) ?? "$0"
    }
    public init(property: Property) {
        self.property = property
    }
}
