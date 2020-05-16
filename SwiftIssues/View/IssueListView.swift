//
//  IssueListView.swift
//  SwiftIssues
//
//  Created by Rafael Nobre on 15/05/20.
//  Copyright © 2020 Rafael Nobre. All rights reserved.
//

import SwiftUI

struct IssueListView: View {
    @ObservedObject var viewModel: IssueListViewModel
    
    init(viewModel: IssueListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    listContent
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Swift Issues")
        }
    }
    
}

private extension IssueListView {
    
    var listContent: some View {
        switch viewModel.state {
        case .loading:
            return AnyView(Text("Loading issues...")).id("Loading")
        case .error(let message):
            return AnyView(Text(message)).id("Error")
        case .ready(let rows):
            return AnyView(ForEach(rows, content: IssueListRowView.init(viewModel:))).id("List")
        }
    }

}
