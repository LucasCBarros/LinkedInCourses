//: [Previous](@previous)

import Foundation

func equals(lhs: Int, rhs: Int) -> Bool {
    return lhs == rhs
}

//equals(lhs: 1.4, rhs: 4.5)

func equals(lhs: Double, rhs: Double) -> Bool {
    return lhs == rhs
}

equals(lhs: 1.4, rhs: 4.5)

let pi: Float = 3.14
let e: Float = 2.71

func equals(lhs: Float, rhs: Float) -> Bool {
    return lhs == rhs
}

equals(lhs: pi, rhs: e)
/// Breaks DRY principle

//: [Next](@next)
