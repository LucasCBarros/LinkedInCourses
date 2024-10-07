//: [Previous](@previous)

import Foundation

/// Works but doesnt respect Single Responsibility Principle ("God" object)
/// Leads to tight coupling
class TaggedData {
    var tag: String
    var data: Data
    
    // 1. Holds data
    init(tag: String, data: Data) {
        self.tag = tag
        self.data = data
    }
    
    // 2. Stores & Loads data
    func persist(to url: URL) throws {
        try self.data.write(to: url)
    }
    convenience init(tag: String, contentOf url: URL) throws {
        let data = try Data(contentsOf: url)
        self.init(tag: tag, data: data)
    }
    
    // 3. Converts data into base64 interpretation
    var base64EncodedString: String {
        return data.base64EncodedString()
    }
}

//: [Next](@next)
