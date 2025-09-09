//
//  ContentView.swift
//  RedBeanIce3.0
//
//  Created by Percy Cheung on 22/6/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            TabView{
                HomeView()
                    .tabItem { Text("Home") }
                    .tag(1)
                RestaurantView()
                    .tabItem{ Text("Restaurant")}
                    .tag(2)
                ReelsView()
                    .tabItem{ Text("Reels")}
                    .tag(3)
                GameView()
                    .tabItem{ Text("Game")}
                    .tag(4)
                LanguageView()
                    .tabItem{ Text("Language")}
                    .tag(5)
            }
        }
        /*
        TabView{
            HomeView()
                .tabItem { Text("Home") }
                .tag(1)
            RestaurantView()
                .tabItem{ Text("Restaurant")}
                .tag(2)
            ReelsView()
                .tabItem{ Text("Reels")}
                .tag(3)
            GameView()
                .tabItem{ Text("Game")}
                .tag(4)
            LanguageView()
                .tabItem{ Text("Language")}
                .tag(5)
        }
         */
    }
}

#Preview {
    ContentView()
}
