//
//  MenuRowView.swift
//  SwiftUIPizza
//
//  Created by Lucas C Barros on 2024-07-25.
//

import SwiftUI

struct MenuRowView: View {
    var item: MenuItem
    
    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            if let image = UIImage(named: "\(item.id)_sm") {
                Image(uiImage: image).font(.largeTitle)
                    .clipShape(Circle())
                    .padding(.trailing, -25)
                    .padding(.leading, -15)
            } else {
                Image("surfboard_sm").font(.largeTitle)
            }
            
            VStack(alignment: .leading) {
                HStack {
                    Text(item.name)
                    Spacer()
                    Text(item.price, format: .currency(code: "USD"))
                }
                RatingsView(rating: item.rating)
            }
        }
    }
}

#Preview {
    MenuRowView(item: testMenuItem)
}
