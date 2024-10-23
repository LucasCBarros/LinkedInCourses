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
    @State private var showMenuGridOrList: Bool = false
    
    var addedItem: Bool = false
    
    var body: some View {
        TabView {
//            PhotoView()  // Can see a viewController
            
            VStack {
                HeaderView()
                    .shadow(radius: 5)
                    .environment(\.colorScheme, .light) //Override environment
                
                //            Button("Switch View") {
                //                showOrders.toggle()
                //            }
                //            .foregroundStyle(.secondary)
                
                StatusBarView(showOrders: $showOrders,
                              showMenuGridOrList: $showMenuGridOrList)
                
//                MenuItemView(item: $selectedItem, orders: orders)
//                    .padding(5)
//                    .background(.thinMaterial, // Picks up the color behind it
//                                in: RoundedRectangle(cornerRadius: 10))
//                
//                if showMenuGridOrList {
//                    MenuGridView(menu: menu, selectedItem: $selectedItem)
//                } else {
//                    MenuView(menu: menu,
//                             selectedItem: $selectedItem)
//                }
                
                MenuView2(menu: menu) // For iPad
            }.tabItem {
                Label("Menu", systemImage: "list.bullet")
            }
            
            VStack{
                HeaderView()
                    .shadow(radius: 5)
                    .environment(\.colorScheme, .light) //Override environment
                
                //            Button("Switch View") {
                //                showOrders.toggle()
                //            }
                //            .foregroundStyle(.secondary)
                
                StatusBarView(showOrders: $showOrders,
                              showMenuGridOrList: $showMenuGridOrList)
                
                //            if showOrders {
                OrderView(orders: orders)
            }.tabItem {
                Label("Order", systemImage: "cart")
            }
            
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
