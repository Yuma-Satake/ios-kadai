import Foundation

struct ZipAddress: Identifiable, Codable {
    var id: String { zipcode }

    let zipcode: String
    let prefcode: String
    let address1: String
    let address2: String
    let address3: String
    let kana1: String
    let kana2: String
    let kana3: String
}

struct ZipcodeResponse: Codable {
    let status: Int
    let message: String?
    let results: [ZipAddress]?
} 