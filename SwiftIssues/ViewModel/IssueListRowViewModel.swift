//
//  IssueListRowViewModel.swift
//  SwiftIssues
//
//  Created by Rafael Nobre on 15/05/20.
//  Copyright © 2020 Rafael Nobre. All rights reserved.
//

import SwiftUI

class IssueListRowViewModel: ObservableObject, Identifiable {
    private let issue: Issue
    
    init(issue: Issue) {
        self.issue = issue
    }
    
    var title: String {
        return issue.title
    }
    
    var stateImage: Image {
        switch issue.state {
        case .closed:
            return Image("issue_closed")
        case .open:
        return Image("issue_open")
        }
    }
    
    var author: String {
        return issue.createdBy.name
    }
}
