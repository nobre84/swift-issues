//
//  IssueListRowView.swift
//  SwiftIssues
//
//  Created by Rafael Nobre on 15/05/20.
//  Copyright © 2020 Rafael Nobre. All rights reserved.
//

import SwiftUI

struct IssueListRowView: View {
    @ObservedObject var viewModel: IssueListRowViewModel
    
    init(viewModel: IssueListRowViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationLink(destination: IssueDetailView(viewModel: viewModel.detailViewModel)) {
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    viewModel.icon
                        .foregroundColor(viewModel.iconColor)
                        .padding(.top, 4)
                    Text(viewModel.title)
                        .font(.body)
                }
                Text(viewModel.subtitle)
                    .font(.footnote)
            }
        }
    }
}

#if DEBUG
struct IssueListRowView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            IssueListRowView(viewModel: IssueListRowViewModel(issue: .dummyOpen))
            IssueListRowView(viewModel: IssueListRowViewModel(issue: .dummyClosed))
        }
    }
}
#endif
