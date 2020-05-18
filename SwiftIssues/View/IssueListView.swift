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
        LoadingView(isShowing: .constant(viewModel.state.isLoading)) {
            NavigationView {
                List {
                    Section {
                        self.listContent
                    }
                }
                .navigationBarTitle("app-title")
            }
        }.onAppear {
            self.viewModel.fetchIssues()
        }
    }
    
}

private extension IssueListView {
    
    var listContent: some View {
        switch viewModel.state {
        case .loading:
            return AnyView(EmptyView()).id("Loading")
        case .error(let error):
            return AnyView(
                Text(error.localizedDescription)
                    .foregroundColor(.gray)
            ).id("Error")
        case .ready(let rows):
            if rows.isEmpty {
                return AnyView(
                    Text("no-issues")
                        .foregroundColor(.gray)
                ).id("Empty")
            }
            return AnyView(ForEach(rows, content: IssueListRowView.init(viewModel:))).id("List")
        }
    }

}

#if DEBUG
struct IssueListView_Previews: PreviewProvider {
    static var previews: some View {
        let errorViewModel = IssueListViewModel()
        errorViewModel.state = .error("Error loading issues")
        
        let emptyViewModel = IssueListViewModel()
        emptyViewModel.state = .ready([])
        
        let regularViewModel = IssueListViewModel()
        regularViewModel.state = .ready([
            IssueListRowViewModel(issue: .dummyOpen),
            IssueListRowViewModel(issue: .dummyClosed)
        ])
        
        return Group {
            IssueListView(viewModel: regularViewModel)
                .previewDisplayName("regular state")
            IssueListView(viewModel: errorViewModel)
                .previewDisplayName("error state")
            IssueListView(viewModel: emptyViewModel)
                .previewDisplayName("empty state")
        }
    }
}
#endif
