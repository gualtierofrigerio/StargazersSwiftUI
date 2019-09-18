//
//  Entities.swift
//  StargazersSwiftUI
//
//  Created by Gualtiero Frigerio on 17/09/2019.
//  Copyright © 2019 Gualtiero Frigerio. All rights reserved.
//

import Foundation

struct Repository:Codable {
    var name:String
    var stargazersCount:Int
}

struct User:Codable, Identifiable {
    var id:String {
        return login
    }
    var login:String
    var avatarUrl:String
}
