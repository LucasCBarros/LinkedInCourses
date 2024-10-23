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
            
            NavigationStack {
                List{
                    ForEach($orders.orderItems) { $order in
                        //                        Text(order.item.name)
                        NavigationLink(value: order) {
                            
                            OrderRowView(order: $order)
                                .padding(.bottom, 5)
                                .padding([.leading, .trailing], 7)
                        }.navigationDestination(for: OrderItem.self) { order in
                            OrderDetailView(orderItem: $order, presentSheet: .constant(false), newOrder: .constant(false))
                        }.navigationTitle("Your Order")
                    }
                    .onDelete { indexSet in
                        orders.orderItems.remove(atOffsets: indexSet)
                    }
                    .onMove { source, destination in
                        orders.orderItems.move(fromOffsets: source,
                                               toOffset: destination)
                        
                    }
                }
            }
//            .padding(20)
//            
//            Button("Delete Order") {
//                if !orders.orderItems.isEmpty { orders.removeLast() }
//            }
//            .padding(5)
//            .background(.regularMaterial, in: Capsule())
//            .padding(7)
        }
        .background(.regularMaterial)
    }
}


#Preview {
    OrderView(orders: OrderModel())
}
