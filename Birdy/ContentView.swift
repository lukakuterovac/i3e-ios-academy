//
//  ContentView.swift
//  Birdy
//
//  Created by Luka Kuterovac on 09.12.2022..
//

import SwiftUI

struct ContentView: View {
        
    @State var tweets: [TweetModel] = [
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
    @State var username = ""
    @State var content: String = ""
    @State var isLoginViewPresented = false
    
    var body: some View {
        VStack {
            HStack{
                Text(username.isEmpty ? "Birdy" : "Welcome, " + username)
                    .font(.title)
                Spacer()
                Button(action: { isLoginViewPresented = true }) {
                    Text("Login")
                }
            }
            List($tweets){ tweet in
                Tweet(tweet: tweet)
            }.listStyle(.plain)
        }
        .padding()
        
        HStack {
            TextField("Content", text: $content)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.center)
                .autocapitalization(.none)
            Button(action: {
                tweets.append(TweetModel(
                    content: content,
                    username: username,
                    date: Date(),
                    image: "bird",
                    isFavorite: false))
            }) {
                Image(systemName: "plus")
                Text("New Tweet")
            }
            .disabled(content.isEmpty)
        }
        .padding()
        .sheet(isPresented: $isLoginViewPresented) {
            LoginView(
                username: $username,
                isPresented: $isLoginViewPresented)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
