//
//  DetailViewModel.swift
//  Task
//
//  Created by Doha Tubaileh on 21/5/2021.
//

import Foundation

struct DetailViewModel {
    
    let name : String
    let company : String
    let blog : String
    let location : String
    let email : String
    let hireable : String
    let bio : String
    
    init(detail: PersonDetail) {
        let deafultDash = "-"
        
        name = "Name: \(detail.name ?? deafultDash)"
        company = "Company: \(detail.company ?? deafultDash)"
        blog = "Blog: \(detail.blog ?? deafultDash)"
        location = "Location: \(detail.location ?? deafultDash)"
        email = "Email: \(detail.email ?? deafultDash)"
        hireable = "Hireable: \(detail.hireable ?? deafultDash)"
        bio = "Bio: \(detail.bio ?? deafultDash)"
    }
    
}
