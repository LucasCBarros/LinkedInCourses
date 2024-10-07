//: [Previous](@previous)

import Foundation

class TaggedData {
    var tag: String
    var data: Data
    
    // 1. Holds data
    init(tag: String, data: Data) {
        self.tag = tag
        self.data = data
    }
}

// local persistent feature (Single Responsibility)
class PersistentTaggedData: TaggedData {
    // 2. Stores & Loads data
    func persist(to url: URL) throws {
        try self.data.write(to: url)
    }
    
    convenience init(tag: String, contentOf url: URL) throws {
        let data = try Data(contentsOf: url)
        self.init(tag: tag, data: data)
    }
}

class taggedDataWithEncoding: TaggedData {
    // 3. Converts data into base64 interpretation
    var base64EncodedString: String {
        return data.base64EncodedString()
    }
}

// Error can't multi inhert
//class PersistedBase64Encoded: PersistentTaggedData, taggedDataWithEncoding {
//    
//}

/// Can lead to Type explosion
/// Cant do subclassing in value types
//struct Tagged: TaggedData {
//    
//}

//: [Next](@next)
