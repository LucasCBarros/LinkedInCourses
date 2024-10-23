//
//  MenuGridView.swift
//  SwiftUIPizza
//
//  Created by Lucas C Barros on 2024-10-21.
//

import SwiftUI

struct MenuGridView: View {
    @State var menu: [MenuItem]
    @State var favoritePizzaMenu: [MenuItem] = []
    
    func menu(id: Int) -> MenuItem {
        menu.first(where: {$0.id == id}) ?? noMenuItem
    }
    
    @Binding var selectedItem: MenuItem
    let columnLayout = Array(repeating: GridItem(spacing: 39),
                             count: 3) // Colunms
    let favoriteColumnLayout = Array(repeating: GridItem(),
                             count: 5) // Colunms
    
    @Namespace private var nspace
    
    var body: some View {
        VStack {
//            Text("Favorite Pizzas")
            LazyVGrid(columns: favoriteColumnLayout) {
                ForEach(favoritePizzaMenu.sorted(by: { $0.name < $1.name })) { item in
                    FavoriteTileView(menuItem: item)
                    
//                        .matchedGeometryEffect(id: item, in: nspace)
                    
                        .onTapGesture(count: 2) { // Has to click twice to select
                            self.favoritePizzaMenu = favoritePizzaMenu.filter { $0 != item }
                            self.menu.append(item)
                        }
                }
            }
            
//            Text(selectedItem.name)
            ScrollView {
                LazyVGrid(columns: columnLayout) {
                    ForEach(menu.sorted(by: { $0.name < $1.name })) { item in
                        MenuItemTileView(menuItem: item)
//                            .matchedGeometryEffect(id: item.id, in: nspace)
                        
//                          .onTapGesture {
//                          .onTapGesture(count: 2) { // Has to click twice to select
                            .animation(.easeOut, value:  favoritePizzaMenu)
//                            .onTapGesture {
//                                selectedItem = menu(id: item)
//                            }
                            .onTapGesture {
                                selectedItem = item
                                if !favoritePizzaMenu.contains(item) {
                                    withAnimation(.easeInOut){
                                        self.favoritePizzaMenu.append(item)
                                        self.menu = self.menu.filter { $0 != item }
                                    }
                                }
                                
                            }
                            .onLongPressGesture { // Needs to hold down to click
                                self.favoritePizzaMenu = favoritePizzaMenu.filter { $0 != item }
                                selectedItem = noMenuItem
                            } // Order is important, the long press needs to be after the tap gesture
                    }
                }
            }
        }
        .animation(.easeOut(duration: 1.5), // Makes this slower or faster
                   value:  favoritePizzaMenu)
    }
}

#Preview {
    MenuGridView(menu: MenuModel().menu,
                 selectedItem: .constant(testMenuItem))
}
