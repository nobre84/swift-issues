//
//  GitHubService.swift
//  SwiftIssues
//
//  Created by Rafael Nobre on 15/05/20.
//  Copyright © 2020 Rafael Nobre. All rights reserved.
//

import Moya

/// Declares the available endpoints for the GitHub service.
enum GitHubService {
    
    enum Owner {
        case apple
        case custom(String)
        
        var name: String {
            switch self {
            case .apple:
                return "apple"
            case .custom(let name):
                return name
            }
        }
    }
    
    enum Repo {
        case swift
        case custom(String)
        
        var name: String {
            switch self {
            case .swift:
                return "swift"
            case .custom(let name):
                return name
            }
        }
    }
    
    case issues(owner: Owner, repo: Repo)
}

// MARK: - Adopts TargetType for Moya integration
extension GitHubService: TargetType {
    
    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }
    
    var path: String {
        switch self {
        case .issues(let owner, let repo):
            return "/repos/\(owner.name)/\(repo.name)/issues"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .issues:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .issues:
            return .requestPlain
        }
    }
    
    var sampleData: Data {
        switch self {
        case .issues:
            return "[]".utf8Encoded
        }
    }
    
    var headers: [String: String]? {
        return [:]
    }
}
