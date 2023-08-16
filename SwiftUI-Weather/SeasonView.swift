//
//  SeasonView.swift
//  SwiftUI-Weather
//
//  Created by Mohit Khandal on 28/07/23.
//

import SwiftUI

struct SeasonView: View {
    
    var seasons: [Season] = [
        .init(name: "Summer", imageName: "sun.max", color: .yellow),
        .init(name: "Winter", imageName: "cloud.snow", color: .blue),
        .init(name: "Spring", imageName: "wind", color: .green),
    ]
    
    var games: [Game] = [
        .init(name: "Minecraft", rating: 9),
        .init(name: "God Of War", rating: 8),
        .init(name: "Need For Speed", rating: 10)]
    
    var body: some View {
        NavigationStack{
            List {
                Section ("Seasons") {
                    ForEach(seasons, id: \.name) { value in
                        NavigationLink(value: value){
                            Label(value.name, systemImage: value.imageName)
                        }
                    }
                }
                Section ("Games") {
                    ForEach(games, id: \.name) { value in
                        NavigationLink(value: value) {
                            Text(value.name)
                        }
                    }
                }
                NavigationLink {
                    SecondScreen()
                } label: {
                    Text("Click Me")
                }
            }.navigationTitle("Weather")
                .navigationDestination(for: Season.self) { data in
                    ZStack {
                        data.color.ignoresSafeArea()
                        Label(data.name, systemImage: data.imageName)
                            .font(.largeTitle).bold()
                    }
                }
                .navigationDestination(for: Game.self) { gameData in
                    Text("\(gameData.name) - \(gameData.rating)")
                }
        }
        
        
        
        
    }
}

struct SeasonView_Previews: PreviewProvider {
    static var previews: some View {
        SeasonView()
    }
}

struct Season: Hashable {
    let name: String
    let imageName: String
    let color: Color
}

struct Game: Hashable {
    let name: String
    let rating: Int
}
