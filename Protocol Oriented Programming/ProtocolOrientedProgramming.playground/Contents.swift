import UIKit

/// Works but doesnt respect Single Responsibility Principle ("God" object)
/// Leads to tight coupling
class TaggedData {
    
    // 1. Holds data
    var tag: String
    var data: Data
    
    init(tag: String, data: Data) {
        self.tag = tag
        self.data = data
    }
    
    // 2. Stores Data & Loads Data
    func persist(to url: URL) throws {
        try self.data.write(to: url)
    }
    
    convenience init(tag: String, contentOf url: URL) {
        let data = try Data(contentsOf: url)
        self.init(tag: tag, data: data)
    }
    
    // 3. Returns base64 representation
    var base64EncodedString: String {
        return data.base64EncodedString()
    }
}
