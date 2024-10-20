//
//  RatingsView.swift
//  SwiftUIPizza
//
//  Created by Lucas C Barros on 2024-07-25.
//

import SwiftUI

struct RatingsView: View {
    var rating: Int
    var body: some View {
        HStack {
        ForEach(1...5, id: \.self) { icon in
                var rating = rating < icon
                Image(systemName: rating
                      ? "fork.knife.circle"
                      : "fork.knife.circle.fill")
            }
        }
    }
}

#Preview {
    RatingsView(rating: 4)
}
