//: [Previous](@previous)

import Foundation

// 1. Holds data
protocol Taggable {
    var tag: String { get set }
    var data: Data { get set }
    
    init(tag: String, data: Data)
}

protocol TaggedPersistable: Taggable {
    init(tag: String, contentOf url: URL) throws
    func persist(to url: URL) throws
}
extension TaggedPersistable {
    // 2. Stores & Loads data
    func persist(to url: URL) throws {
        try self.data.write(to: url)
    }
    
    init(tag: String, contentOf url: URL) throws {
        let data = try Data(contentsOf: url)
        self.init(tag: tag, data: data)
    }
}

protocol TaggedEncodable: Taggable {
    var base64EncodedString: String { get }
}
extension TaggedEncodable {
    // 3. Converts data into base64 interpretation
    var base64EncodedString: String {
        return data.base64EncodedString()
    }
}

//class MyTaggedData: Taggable {
//    var tag: String
//    var data: Data
//    
//    required init(tag: String, data: Data) {
//        self.tag = tag
//        self.data = data
//    }
//}

struct MyTaggedData: TaggedPersistable, TaggedEncodable {
    var tag: String
    var data: Data
}

let taggedData = MyTaggedData(tag: "First", data: Data(repeating: 0, count: 1))
let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
let url = documentsURL(to:url)

try? taggedData.persist(to: url)

let string = taggedData.base64EncodedString

//: [Next](@next)
