//
//  OrderView.swift
//  SwiftUIPizza
//
//  Created by Lucas C Barros on 2024-07-25.
//

import SwiftUI

struct OrderView: View {
//    @Binding var orders: [OrderItem]
    @ObservedObject var orders: OrderModel = OrderModel()
    
    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                
                ScrollView {
                    ForEach($orders.orderItems) { order in
//                        Text(order.item.name)
                        OrderRowView(order: order)
                            .padding(.bottom, 5)
                            .padding([.leading, .trailing], 7)
                    }
                }
                .padding(.top, 60)
                
                HStack {
    //                Label("Cart", systemImage: "cart")
                    Text("Order Pizza!")
                        .font(.title)
                    Spacer()
                    
                    
                }
                .padding(10)
                .background(.ultraThinMaterial)
                
            }
            .padding(20)
    //        .padding() // Careful to put padding before or it will do on the background
        .cornerRadius(20)
            
            Button("Delete Order") {
                if !orders.orderItems.isEmpty { orders.removeLast() }
            }
            .padding(5)
            .background(.regularMaterial, in: Capsule())
            .padding(7)
        }
        .background(Color("Surf"))
    }
}


#Preview {
    OrderView(orders: OrderModel())
}
