//: [Previous](@previous)

import Foundation

// Push(element)
// Pop()
// Peek()
// Count()
// isEmpty()

protocol Stackable<T> {
    var elements: [T] { get set }
    var count: Int { get }
    var isEmpty: Bool { get }
    
    func init(elements: [T])
    func push(element: T)
    func pop()
    func peek()
}

struct Stack: Stackable {
    var elements: [T]
    var count: Int {
        elements.count
    }
    var isEmpty: Bool {
        elements.isEmpty
    }
    
    func init(elements: [T]) {
        self.elements = elements
    }
    
    func push(element: T) {
        self.elements.append(element)
    }
    
    func pop() {
        elements.removeFirst()
    }
    
    func peek() -> T {
        elements.first
    }
}

let deckOfCards = Stack()

deckOfCards.push(element: "A")
deckOfCards.count
deckOfCards.isEmpty
deckOfCards.peek()
deckOfCards.pop()


//: [Next](@next)
