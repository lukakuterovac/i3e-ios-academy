//
//  ContentView.swift
//  Birdy
//
//  Created by Luka Kuterovac on 09.12.2022..
//

import SwiftUI

struct ContentView: View {
        
    let tweets: [TweetModel] = [
        TweetModel(
            content: "Tweet 1",
            username: "username",
            date: Date(),
            image: "bird",
            isFavorite: true
        ),
        TweetModel(
            content: "Tweet 2",
            username: "username",
            date: Date(),
            image: "bird",
            isFavorite: false
        ),
    ]
    
    var body: some View {
        VStack {
            HStack{
                Text("Birdy")
                    .font(.title)
                Spacer()
                Button(action: {}) {
                    Text("Login")
                }
            }
            List(tweets){ tweet in
                Tweet(tweet: tweet)
            }.listStyle(.plain)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
