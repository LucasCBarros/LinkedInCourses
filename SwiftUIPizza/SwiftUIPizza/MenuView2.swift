//
//  MenuView2.swift
//  SwiftUIPizza
//
//  Created by Lucas C Barros on 2024-10-22.
//

import SwiftUI

struct MenuView2: View {
    var menu: [MenuItem]
    @State private var selectedItem: MenuItem? = nil
    
    var body: some View {
        NavigationSplitView {
            List(menu, selection: $selectedItem) { item in
                NavigationLink(value: item) {
                    MenuRowView(item: item)
                }
            }
        } detail: {
            MenuDetailView(item: $selectedItem)
        }
    }
}

#Preview {
    MenuView2(menu: MenuModel().menu)
}
