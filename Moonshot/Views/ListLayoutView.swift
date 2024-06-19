//
//  ListLayoutView.swift
//  Moonshot
//
//  Created by Gunther Masi Haas on 19/06/2024.
//

import SwiftUI

struct ListLayoutView: View {
    
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    
    var body: some View {
            List(missions) { mission in
                NavigationLink(destination: MissionView(mission: mission, astronauts: astronauts)) {
                    HStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70, height: 70)
                        
                        Spacer()
                        
                        VStack {
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundColor(.white)
                            Text(mission.formattedLaunchDate)
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.5))
                        }
                        
                        Spacer()
                    }
                    .padding()
                    .background(.lightBackground)
                    .cornerRadius(10)
                }
                .listRowBackground(Color.darkBackground)
            }
            .listStyle(.plain)
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
   return ListLayoutView(missions: missions, astronauts: astronauts)
}
