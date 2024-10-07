//
//  ContentView.swift
//  WeatherApp
//
//  Created by Lucas C Barros on 2024-10-06.
//

import SwiftUI

struct ContentView: View {
    @State private var input: String = "Vancouver"
    
    @ObservedObject var weatherViewModel = WeatherViewModel()
    
    var body: some View {
        VStack {
            TextField("Enter city",
                      text: $input,
                      onEditingChanged: {
                (_) in },
                      onCommit: {
                    if !self.input.isEmpty {
                        self.weatherViewModel.fetch(city: self.input)
                    }
                })
                .font(.title)
            
            Divider()
            
            Text("\(weatherViewModel.weatherInfo)")
                .font(.body)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
