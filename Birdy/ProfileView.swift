//
//  ProfileView.swift
//  Birdy
//
//  Created by Luka Kuterovac on 12.12.2022..
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var userData: UserData
    @EnvironmentObject var tweetData: TweetData
    
    var userTweets: [TweetModel] {
        return tweetData.tweets.filter{ tweet in
            return tweet.username == userData.username
        }
    }
    
    var userFavoriteTweets: [TweetModel] {
        return tweetData.tweets.filter{ tweet in
            return userData.favoriteTweets.contains(tweet.id)
        }
    }
    
    var body: some View {
        VStack {
            HStack{
                Image(userData.image)
                    .resizable()
                    .frame(width: 55, height: 55)
                    .clipShape(Circle())
                Text(userData.username).font(.title).fontWeight(.bold)
                Spacer()
            }.padding()
            List {
                Section("Tweets") {
                    ForEach(userTweets) { tweetModel in
                        Tweet(tweet: Binding.constant(tweetModel))
                    }
                }
                
                Section("Favorite tweets") {
                    ForEach(userFavoriteTweets) { tweetModel in
                        Tweet(tweet: Binding.constant(tweetModel))
                    }
                }
                
            }.listStyle(.plain)
        }.padding()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView().environmentObject(TweetData()).environmentObject(UserData())
    }
}
