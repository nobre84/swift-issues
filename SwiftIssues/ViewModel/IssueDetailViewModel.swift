//
//  IssueDetailViewModel.swift
//  SwiftIssues
//
//  Created by Rafael Nobre on 15/05/20.
//  Copyright © 2020 Rafael Nobre. All rights reserved.
//

import Foundation

class IssueDetailViewModel: ObservableObject, Identifiable {
    private let issue: Issue
    private let urlOpener: URLOpener
    
    init(issue: Issue, urlOpener: URLOpener = URLOpenerImpl()) {
        self.issue = issue
        self.urlOpener = urlOpener
    }
    
    var navigationTitle: String {
        return "#\(issue.number)"
    }
    
    var title: String {
        return issue.title
    }
    
    var description: String {
        return issue.description ?? ""
    }
    
    var author: String {
        return issue.author.name
    }
    
    var avatar: URL {
        return issue.author.avatarURL
    }
    
    var date: String {
        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.timeStyle = .short
        formatter.dateStyle = .short
        return formatter.string(from: issue.createdAt)
    }
    
    func openInGitHub() {
        urlOpener.open(issue.htmlURL)
    }
}
