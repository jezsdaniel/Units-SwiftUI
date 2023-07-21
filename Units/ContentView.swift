//
//  ContentView.swift
//  Units
//
//  Created by J. Daniel F. Ruano on 7/19/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            TemperatureView()
                .tabItem {
                    Image(systemName: "thermometer").environment(\.symbolVariants, .none)
                    Text("Temperature")
                }
            LengthView()
                .tabItem {
                    Image(systemName: "ruler").environment(\.symbolVariants, .none)
                    Text("Lenght")
                }
            TimeView()
                .tabItem {
                    Image(systemName: "clock").environment(\.symbolVariants, .none)
                    Text("Time")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
