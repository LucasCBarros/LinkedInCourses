//: [Previous](@previous)

import Foundation

/// Dictionary, Array and Sets are implemented with Generics

func equals<T: Equatable>(lhs: T, rhs: T) -> Bool {
    return lhs == rhs
}

equals(lhs: "A", rhs: "b")
equals(lhs: 1, rhs: 2)
equals(lhs: 1, rhs: 1)
//equals(lhs: "A", rhs: 2)

//: [Next](@next)
