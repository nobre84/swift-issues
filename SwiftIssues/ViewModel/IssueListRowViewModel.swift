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
    
    var icon: Image {
        switch issue.state {
        case .closed:
            return Image("issue_closed")
        case .open:
            return Image("issue_open")
        }
    }
    
    var iconColor: Color {
        switch issue.state {
        case .closed:
            return .red
        case .open:
            return .green
        }
    }
    
    var subtitle: String {
        return "#\(issue.number) opened \(relativeDate) by \(issue.author.name)"
    }
    
    var detailViewModel: IssueDetailViewModel {
        return IssueDetailViewModel(issue: issue)
    }
    
    private var relativeDate: String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full

        // get exampleDate relative to the current date
        let relativeDate = formatter.localizedString(for: issue.createdAt, relativeTo: Date())
        return relativeDate
    }
}
