//: [Previous](@previous)

import Foundation

protocol Taggable {
    var tag: String { get set }
    var data: Data { get set }
    init(tag: String, data: Data)
}

/// Dedicated protocol for each set of requirements

protocol TaggedPersistable: Taggable, CustomStringConvertible. Equatable {
    init(tag: String, contentOf url: URL) throws
    
    func persist(to url: URL) throws
}

protocol TaggedEncodable: Taggable {
    var base64: String { get }
}

//: [Next](@next)
