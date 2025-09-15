import Foundation

public enum PropertyStatus: String, Codable, Equatable {
    case forSale = "For Sale"
    case sold = "Sold"
    case pending = "Pending"
}

public struct Property: Identifiable, Equatable {
    public let id: UUID
    public let address: String
    public let zipCode: String
    public let price: Double
    public let bedrooms: Int
    public let bathrooms: Int
    public let squareFeet: Int
    public let description: String
    public let status: PropertyStatus
    public init(id: UUID = UUID(), address: String, zipCode: String, price: Double, bedrooms: Int, bathrooms: Int, squareFeet: Int, description: String, status: PropertyStatus = .forSale) {
        self.id = id
        self.address = address
        self.zipCode = zipCode
        self.price = price
        self.bedrooms = bedrooms
        self.bathrooms = bathrooms
        self.squareFeet = squareFeet
        self.description = description
        self.status = status
    }
}
