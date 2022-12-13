//
//  UserData.swift
//  Birdy
//
//  Created by Luka Kuterovac on 12.12.2022..
//

import Foundation
import Combine

class UserData: ObservableObject {
    @Published var username: String = "username"
    @Published var image: String = "bird"
    @Published var favoriteTweets: Set<String> = []
}
