//
//  ContentView.swift
//  SwiftUIPizza
//
//  Created by Lucas C Barros on 2024-07-25.
//

import SwiftUI

struct ContentView: View {
    var menu: [MenuItem]
    @StateObject var orders: OrderModel = OrderModel()
    @State private var showOrders: Bool = false // State should always be private
    @State private var selectedItem: MenuItem = noMenuItem
    
    var addedItem: Bool = false
    
    var body: some View {
        VStack {
            HeaderView()
                .shadow(radius: 5)
                .environment(\.colorScheme, .light) //Override environment 
            
//            Button("Switch View") {
//                showOrders.toggle()
//            }
//            .foregroundStyle(.secondary)
            
            StatusBarView(showOrders: $showOrders)
            
            if showOrders {
                OrderView(orders: orders)
            } else {
                MenuItemView(item: $selectedItem, orders: orders)
                    .padding(5)
                    .background(.thinMaterial, // Picks up the color behind it
                                in: RoundedRectangle(cornerRadius: 10))
                
                MenuView(menu: menu,
                         selectedItem: $selectedItem)
            }
            
            Spacer()
        }
        .padding()
//        .background(Color.cyan)
        .background(.linearGradient(colors: [.cyan, Color("Surf"),
                                             Color("Sky")],
                                    startPoint: .topLeading,
                                    endPoint: .bottom))
        .environmentObject(orders)
    }
}

#Preview {
    ContentView(menu: MenuModel().menu)
}
