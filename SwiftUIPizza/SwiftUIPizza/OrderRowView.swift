//
//  OrderRowView.swift
//  SwiftUIPizza
//
//  Created by Lucas C Barros on 2024-07-25.
//

import SwiftUI

struct OrderRowView: View {
    @Binding var order: OrderItem
    var price: Double = 19.90
    var quantity: Int = 1
    
    var body: some View {
        HStack(alignment: .bottom) {
            VStack {
                Text("\(order.item.name)")
                Text("_ " + order.preferredCrust.rawValue)
                Text("\(order.quantity) @ \(order.item.price)")
                
                if order.extraIngredients {
                    Image(systemName: "2.circle")
                }
            }
            Spacer()
            Text(order.item.price, format: .currency(code: "USD"))
                .fontWeight(.semibold)
        }
        .padding(5)
        .background(.regularMaterial)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

#Preview {
    OrderRowView(order: .constant(testOrderItem))
}
