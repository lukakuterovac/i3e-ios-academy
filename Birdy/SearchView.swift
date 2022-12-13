//
//  SearchView.swift
//  Birdy
//
//  Created by Luka Kuterovac on 12.12.2022..
//

import SwiftUI

struct SearchView: View {
    
    @EnvironmentObject var tweetData: TweetData
    @State var query: String = ""
    
    var foundTweets: [TweetModel] {
        return tweetData.tweets.filter{ tweet in
            return tweet.content.lowercased().contains(query.lowercased())
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Search")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
            }
            TextField("Content", text: $query)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.center)
                .autocapitalization(.none)
            List(foundTweets){ tweetModel in
                Tweet(tweet: Binding.constant(tweetModel))
            }.listStyle(.plain)
        }.padding()
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .environmentObject(TweetData())
    }
}
