//
//  User.swift
//  SwiftIssues
//
//  Created by Rafael Nobre on 15/05/20.
//  Copyright © 2020 Rafael Nobre. All rights reserved.
//

import Foundation

struct User: Decodable {
    let name: String
    let avatarURL: URL
    
    enum CodingKeys: String, CodingKey {
        case name = "login"
        case avatarURL = "avatar_url"
    }
}

#if DEBUG
extension User {
    static var dummyMale: Self {
        return User(name: "John Doe",
                    avatarURL: URL(string: "https://robohash.org/95716ee4ea89ca5338d56b78aaea2e28?set=set4&bgset=&size=200x200")!)
    }
    
    static var dummyFemale: Self {
        return User(name: "Maria Gutierrez",
                    avatarURL: URL(string: "https://robohash.org/76247ccef4ca099b8b91f53a2178d92c?set=set4&bgset=&size=200x200")!)
    }
}
#endif
