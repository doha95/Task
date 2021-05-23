//
//  PersonDetail.swift
//  Task
//
//  Created by Doha Tubaileh on 21/5/2021.
//

import Foundation

struct PersonDetail : Decodable {
    let avatarURL : String?
    let name : String?
    let company : String?
    let blog : String?
    let location : String?
    let email : String?
    let hireable : String?
    let bio : String?
    
    enum CodingKeys: String, CodingKey {
        case avatarURL = "avatar_url"
        case name = "name"
        case company = "company"
        case blog = "blog"
        case location = "location"
        case email = "email"
        case hireable = "hireable"
        case bio = "bio"
    }
}
