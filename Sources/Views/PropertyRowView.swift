import SwiftUI

public struct PropertyRowView: View {
    public let property: Property
    public init(property: Property) {
        self.property = property
    }
    public var body: some View {
        VStack(alignment: .leading) {
            Text(property.address)
                .font(.headline)
            Text("$\(Int(property.price)) • \(property.bedrooms) beds • \(property.bathrooms) baths")
                .font(.subheadline)
        }
        .padding()
    }
}
