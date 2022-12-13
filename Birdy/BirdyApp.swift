//
//  BirdyApp.swift
//  Birdy
//
//  Created by Luka Kuterovac on 09.12.2022..
//

import SwiftUI

@main
struct BirdyApp: App {
    
    @StateObject var tweetData = TweetData()
    @StateObject var userData = UserData()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                    .tabItem{
                        Label("Feed",systemImage:"list.bullet.circle")
                    }
                SearchView()
                    .tabItem{
                        Label("Search", systemImage: "magnifyingglass.circle")
                    }
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.circle")
                    }
            }
            .environmentObject(tweetData)
            .environmentObject(userData)
        }
    }
}
