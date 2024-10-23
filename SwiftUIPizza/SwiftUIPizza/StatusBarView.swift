//
//  StatusBarView.swift
//  SwiftUIPizza
//
//  Created by Lucas C Barros on 2024-10-19.
//

import SwiftUI

struct StatusBarView: View {
    @Binding var showOrders: Bool
    @Binding var showMenuGridOrList: Bool
    @EnvironmentObject var orders: OrderModel
    
    var body: some View {
        HStack {
            Text("\(orders.orderItems.count) orders")
            
            Spacer()
            
            Button {
                showOrders.toggle()
            } label: {
                Image(systemName: showOrders ? "cart" : "menucard")
            }
            
            
            if !showOrders {
                Button {
                    showMenuGridOrList.toggle()
                } label: {
                    Image(systemName: !showMenuGridOrList ? "square.grid.3x2" : "list.bullet")
                }
                .padding(10)
            }
            
            Spacer()
            
            Label {
                Text(orders.orderTotal, format: .currency(code: "USD"))
            } icon: {
                Image(systemName: orders.orderItems.isEmpty ? "cart" : "cart.circle.fill")
            }
        
        }
        .foregroundStyle(.white)
        .font(.title2)
    }
}

#Preview {
    StatusBarView(showOrders: .constant(false),
                  showMenuGridOrList: .constant(false))
    .environmentObject(OrderModel())
    .background(.black)
}
