//: [Previous](@previous)

import Foundation

protocol Service {
    var balance: Float { get }
    init()
    
    func orderPlaced(value: Float)
    func checkBalance() -> Float
}
extension Service {
    func checkBalance() -> Float {
        return balance
    }
}

public class AmazonService: Service {
    var balance: Float = 0
    required init() { }
    func orderPlaced(value: Float) {
        self.balance += value
    }
}

public class EtsyService: Service {
    var balance: Float = 0
    required init() { }
    func orderPlaced(value: Float) {
        self.balance += value
    }
}


class PaymentController {
    let services: [Service]
    
    init(services: [Service]) {
        self.services = services
    }
    
    func calculateEarnings() -> Float {
        var total: Float = 0
        for service in services {
            total += service.checkBalance()
        }
        return total
    }
}

let amazonService: Service = AmazonService()
let etsyService: Service = EtsyService()

let controller = PaymentController(services: [amazonService, etsyService])

amazonService.orderPlaced(value: 100)
etsyService.orderPlaced(value: 25)
amazonService.orderPlaced(value: 12.50)

print("Total earned: \(controller.calculateEarnings())")

//: [Next](@next)
