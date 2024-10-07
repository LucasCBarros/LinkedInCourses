//: [Previous](@previous)

import Foundation

/// Can't have multiple class inhertance, but can adopt multiple protocols

protocol Taggable {
    var tag: String { get set }
    var data: Data { get set }
    init(tag: String, data: Data)
}

protocol TaggedPersistable: Taggable, CustomStringConvertible. Equatable {
    init(tag: String, contentOf url: URL) throws
    
    func persist(to url: URL) throws
}

protocol TaggedEncodable: Taggable {
    var base64: String { get }
}

//struct MyData: TaggedPersistable, TaggedEncodable {
struct MyData: Taggable {
//    init(tag: String, contentOf url: URL) throws {
//        let data = try Data.init(contentsOf: url)
//        self.init(tag:tag, data: data)
//    }
//    
//    func persist(to url: URL) throws {
//        try self.data.write(to: url)
//    }
    
//    func base64: String {
//        return self.data.base64EncodedString()
//    }
    
    var tag: String
    var data: Data
    
    init(tag: String, data: Data) {
        self.tag = tag
        self.data = data
    }
    
//    var description: String {
//        return "MyData\(tag)"
//    }
}

/// Refactor for redability

extension MyData: CustomStringConvertible {
    var description: String {
        return "MyData\(tag)"
    }
}

extension MyData: TaggedEncodable {
    func base64: String {
        return self.data.base64EncodedString()
    }
}

extension MyData: TaggedPersistable {
    init(tag: String, contentOf url: URL) throws {
        let data = try Data.init(contentsOf: url)
        self.init(tag:tag, data: data)
    }
    
    func persist(to url: URL) throws {
        try self.data.write(to: url)
    }
}

//: [Next](@next)
