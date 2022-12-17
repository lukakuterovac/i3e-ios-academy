//
//  ContentView.swift
//  Birdy
//
//  Created by Luka Kuterovac on 09.12.2022..
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var tweetData: TweetData
    @EnvironmentObject var userData: UserData
    @State var content: String = ""
    @State var isLoginViewPresented = false
    
    var body: some View {
        VStack {
            HStack{
                Text(userData.username.isEmpty ? "Birdy" : "Welcome, " + userData.username)
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                Button(action: { isLoginViewPresented = true }) {
                    Text("Login")
                }
            }
            List($tweetData.tweets){ tweet in
                Tweet(tweet: tweet)
            }.listStyle(.plain)
            HStack {
                TextField("Content", text: $content)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
                    .autocapitalization(.none)
                Button(action: {
                    tweetData.tweets.append(TweetModel(
                        content: content,
                        username: userData.username,
                        date: Date(),
                        imageURL: IMAGE_URL))
                }) {
                    Image(systemName: "plus")
                    Text("New Tweet")
                }
                .disabled(content.isEmpty)
            }
            .padding()
            .sheet(isPresented: $isLoginViewPresented) {
                LoginView(
                    username: $userData.username,
                    isPresented: $isLoginViewPresented)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(TweetData())
            .environmentObject(UserData())
    }
}
