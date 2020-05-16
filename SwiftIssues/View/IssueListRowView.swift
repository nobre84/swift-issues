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
        VStack {
            HStack {
                viewModel.stateImage
                Text(viewModel.title)
            }
            Text("Opened by \(viewModel.author)")
        }
    }
}
