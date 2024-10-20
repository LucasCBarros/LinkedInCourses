//
//  MenuItemView.swift
//  SwiftUIPizza
//
//  Created by Lucas C Barros on 2024-07-25.
//

import SwiftUI

struct MenuItemView: View {
    @State private var addedItem: Bool = false
    @Binding var item: MenuItem
    @ObservedObject var orders: OrderModel = OrderModel()
    
    var body: some View {
        VStack {
            
            HStack {
                Text(item.name)
                    .font(.title)
                
                //                    .bold()
                    .fontWeight(.semibold)
                
                //                    .foregroundColor(Color(red: 0.38, green: 0.522, blue: 0.749))
                //                    .foregroundColor(Color("Surf"))
                    .foregroundStyle(.ultraThickMaterial)
                
                    .padding(.leading)
//                    .frame(width: 200, height: 50) // Frame will dominate the size, with the height it wont word wrap anymore
//                    .frame(minWidth: 150, maxWidth: 1000, maxHeight: 300) // Still avoid Frame modifier
                    
                
                
                
                if let image = UIImage(named: "\(item.id)_lg") {
                    Image(uiImage: image) //.font(.largeTitle)
                        .resizable()
                        .scaledToFit()
                    
                        .padding([.top, .bottom], 5)
                    
                    //                    .clipShape(RoundedRectangle(cornerRadius: 10))
                        .cornerRadius(15)
                    
                        
                } else {
                    Image("surfboard_lg") //.font(.largeTitle)
                        .resizable()
                        .scaledToFit()
                        
                        .rotationEffect(.degrees(180))
                }
            }
            .background(.linearGradient(colors: [Color("Surf"), Color("Sky").opacity(0.1)],
                                        startPoint: .leading,
                                        endPoint: .trailing),
                        in: Capsule())
            .shadow(color: .teal, radius: 15, x: 8, y: 8) // Careful to make shadows after corner radiusn and clipshapes
                
            VStack(alignment: .leading) {
            
                ScrollView {
                    Text(item.description)
                        /*.font(.custom("Georgia", fixedSize: 18))*/ // FixedSize doesnt let dynamic font change
                        .font(.custom("Georgia", size: 18, relativeTo:  .body)) // Goes with accessibility feature
                }
            }
            
            Button {
                addedItem = true
                orders.addOrder(item, quantity: 1)
            } label: {
                Spacer()
                
                Text(item.price, format: .currency(code: "USD")).bold()
                
                Image(systemName: addedItem
                      ? "cart.fill.badge.plus"
                      : "cart.badge.plus")

                Spacer()
            }
            .disabled(item.id < 0)
            .padding()
            .background(.red, in: Capsule())
            .foregroundStyle(.white)
            .padding(5)
        }
    }
}

#Preview {
    MenuItemView(item: .constant(testMenuItem), orders: OrderModel())
}
