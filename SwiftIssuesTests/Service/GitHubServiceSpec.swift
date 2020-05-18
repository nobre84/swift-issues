//
//  GitHubServiceSpec.swift
//  SwiftIssuesTests
//
//  Created by Rafael Nobre on 16/05/20.
//  Copyright © 2020 Rafael Nobre. All rights reserved.
//

import XCTest
import Quick
import Nimble
import Moya
@testable import SwiftIssues

class GitHubServiceTests: QuickSpec {
    
    override func spec() {
        
        describe("github service") {
            
            context("path generation") {
                
                it("generates swift repo path") {
                    let service = GitHubService.issues(owner: .apple, repo: .swift)
                    expect(service.path) == "/repos/apple/swift/issues"
                }
                
                it("generates custom repo path") {
                    let service = GitHubService.issues(owner: .custom("nobre84"), repo: .custom("realm-contacts"))
                    expect(service.path) == "/repos/nobre84/realm-contacts/issues"
                }
            }
            
            context("parameter building") {
                
                it("filters by open state") {
                    expect(GitHubService.issues(owner: .apple,
                                                repo: .swift,
                                                state: .open))
                        .to(containRequestParam("open"))
                }
                
                it("filters by closed state") {
                    expect(GitHubService.issues(owner: .apple,
                                                repo: .swift,
                                                state: .closed))
                        .to(containRequestParam("closed"))
                }
                
                it("filters by all state") {
                    expect(GitHubService.issues(owner: .apple,
                                                repo: .swift,
                                                state: .all))
                        .to(containRequestParam("all"))
                }
                
                it("defaults state to nil") {
                    expect(GitHubService.issues(owner: .apple,
                                                repo: .swift))
                        .to(containRequestParam(nil))
                }
            }
        }
    }
    
}
