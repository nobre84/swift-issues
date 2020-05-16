//
//  Issue.swift
//  SwiftIssues
//
//  Created by Rafael Nobre on 15/05/20.
//  Copyright © 2020 Rafael Nobre. All rights reserved.
//

import Foundation

struct Issue: Decodable {
    enum State: String, Decodable {
        case open
        case closed
    }
    
    let title: String
    let description: String?
    let number: Int
    let createdBy: User
    let createdAt: Date
    let state: State
    let htmlURL: URL
    
    enum CodingKeys: String, CodingKey {
        case title
        case description = "body"
        case number
        case createdBy = "user"
        case createdAt = "created_at"
        case state
        case htmlURL = "html_url"
    }
}
