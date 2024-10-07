//: [Previous](@previous)

import Foundation

protocol Shape {
    var area: Double { get }
}

struct Square: Shape {
    let side: Double
    
    var area: Double {
        return side * side
    }
}

struct Rectangle: Shape {
    let width: Double
    let height: Double
    
    var area: Double {
        return width * height
    }
}

struct Rhombus: Shape {
    let d1: Double
    let d2: Double
    
    var area: Double {
        return (d1 * d2) / 2
    }
}

struct Circle: Shape {
    let radius: Double
    
    var area: Double {
        return radius * .pi * radius
    }
}

var shape: Shape

shape = Rectangle(width: 10, height: 20)
print(shape.area)

shape = Circle(radius: 10)
print(shape.area)

shape = Rhombus(d1: 4, d2: 6)
print(shape.area)


/// Now lets use polymorphism
var shapes = [Shape]()//Array(Shape)

let square = Square(side: 5)
shapes.append(square)

let rectangle = Rectangle(width: 5, height: 10)
shapes.append(rectangle)

let circle = Circle(radius: 5)
shapes.append(circle)

for shape in shapes {
    print(shape.area)
}

//: [Next](@next)
