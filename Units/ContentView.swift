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
                    Image(systemName: "thermometer")
                    Text("Temperature")
                }
            LengthView()
                .tabItem {
                    Image(systemName: "ruler")
                    Text("Lenght")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
