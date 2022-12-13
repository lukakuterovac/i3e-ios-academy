//
//  Data.swift
//  Birdy
//
//  Created by Luka Kuterovac on 12.12.2022..
//

import Foundation
import Combine

class TweetData: ObservableObject {
    
    @Published var tweets: [TweetModel] = [
        TweetModel(
            content: "Tweet 1",
            username: "username",
            date: Date(),
            image: "bird"
        ),
        TweetModel(
            content: "Tweet 2",
            username: "username",
            date: Date(),
            image: "bird"
        ),
    ]
}
