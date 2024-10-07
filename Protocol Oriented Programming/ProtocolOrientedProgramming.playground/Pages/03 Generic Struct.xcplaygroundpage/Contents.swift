//: [Previous](@previous)

import Foundation

struct StringWrapper {
    var storage: String
}

struct IntWrapper {
    var storage: String
}

struct FloatWrapper {
    var storage: Float
}

struct Wrapper<T: Equatable> {
    var storage: T
    
    init(_ value: T) {
        self.storage = value
    }
}

let piWrapper = Wrapper<Double>(Double.pi)
let simplePiWrapper = Wrapper(Double.pi)

let stringWapper = Wrapper("POP")

let dateWrapper = Wrapper(Date())

//: [Next](@next)
