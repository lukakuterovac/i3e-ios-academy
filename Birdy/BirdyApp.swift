//
//  BirdyApp.swift
//  Birdy
//
//  Created by Luka Kuterovac on 09.12.2022..
//

import SwiftUI

let IMAGE_URL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/Corvus-brachyrhynchos-001.jpg/1200px-Corvus-brachyrhynchos-001.jpg")!

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
            .task(tweetData.fetchTweets)
        }
    }
}
