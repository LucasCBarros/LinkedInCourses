//
//  HeaderView.swift
//  SwiftUIPizza
//
//  Created by Lucas C Barros on 2024-07-25.
//

import SwiftUI

struct HeaderView: View {
    @EnvironmentObject var orders: OrderModel
    @Environment(\.verticalSizeClass) var vSizeClass: UserInterfaceSizeClass?
    
    var body: some View {
        VStack {
            if (vSizeClass ?? .regular) != .compact {
                ZStack {
                    Image("pizzaBanner")
                        .resizable()
                        .scaledToFit()
                    //                .scaledToFill()
                        .ignoresSafeArea() // Needs .resizable first
                    
                    Text("SwiftUI Pizza Company")
                    //                .background()
                        .font(.custom("Georgia", size: 30, relativeTo: .title))
                        .foregroundColor(.white)
                    //                .foregroundColor(Color("Sky"))
                        .foregroundStyle(.regularMaterial)
                        .fontWeight(.semibold)
                }
            } else {
                HStack(alignment: .bottom) {
                    Image("pizzaBanner")
                        .resizable()
                        .scaledToFit()
                    
                    Text("SwiftUI Pizza Company")
                        .font(.custom("Georgia", size: 30, relativeTo: .title))
                        .foregroundColor(Color("Surf"))
                        .fontWeight(.heavy)
                }
            }
            
            
        }
        .background(.ultraThinMaterial)
    }
}

#Preview {
    HeaderView().environmentObject(OrderModel())
}
