//
//  Issue.swift
//  SwiftIssues
//
//  Created by Rafael Nobre on 15/05/20.
//  Copyright © 2020 Rafael Nobre. All rights reserved.
//

import Foundation

struct Issue: Decodable, Equatable {
    enum State: String, Decodable, Equatable {
        case open
        case closed
    }
    
    let title: String
    let description: String?
    let number: Int
    let author: User
    let createdAt: Date
    let state: State
    let htmlURL: URL
    
    enum CodingKeys: String, CodingKey {
        case title
        case description = "body"
        case number
        case author = "user"
        case createdAt = "created_at"
        case state
        case htmlURL = "html_url"
    }
}

#if DEBUG
extension Issue {
    static var dummyOpen: Self {
        let dummyDescription = """
        Adding a fast path that enables us to simplify the successive loop.\r\n\r\nJudging by the abundance of `BoundGenericType::getGenericArgs` usage, we are going to have to call `GenericSignatureImpl::getInnermostGenericParams` much more often once we start storing substitution maps in bound generic type nodes, so this is ensuring the latter is as fast as possible without caching.\r\n
        """
        return Issue(title: "Open issue",
                     description: dummyDescription,
                     number: 1234,
                     author: .dummyMale,
                     createdAt: Date().advanced(by: -5000),
                     state: .open,
                     htmlURL: URL(string: "http://google.com")!)
    }
    
    static var dummyClosed: Self {
        return Issue(title: "Closed issue",
                     description: nil,
                     number: 5678,
                     author: .dummyFemale,
                     createdAt: Date().advanced(by: -5000),
                     state: .closed,
                     htmlURL: URL(string: "http://google.com")!)
    }
}
#endif
