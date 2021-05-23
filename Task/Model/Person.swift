//
//  User.swift
//  Task
//
//  Created by Doha Tubaileh on 19/5/2021.
//

import Foundation

struct Person : Decodable {
    let id : Int
    let userName : String
    let avatarURL : String
    var detail : PersonDetail?
    
    enum CodingKeys: String, CodingKey {
        case id
        case userName = "login"
        case avatarURL = "avatar_url"
    }
}




