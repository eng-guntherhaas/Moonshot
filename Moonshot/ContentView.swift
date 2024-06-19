//
//  ContentView.swift
//  Moonshot
//
//  Created by Gunther Masi Haas on 18/06/2024.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    @State private var isGird = false
    
    var body: some View {
        NavigationView{
            Group{
                if isGird {
                    GridLayoutView(missions: missions, astronauts: astronauts)
                } else {
                    ListLayoutView(missions: missions, astronauts: astronauts)
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar{
                Button(isGird ? "View as List" : "View as Grid", action: toogleGridList)
            }
        }
    }
    
    func toogleGridList() {
        isGird.toggle()
    }
}

#Preview {
    ContentView()
}
