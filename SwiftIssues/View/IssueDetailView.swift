//
//  IssueDetailView.swift
//  SwiftIssues
//
//  Created by Rafael Nobre on 16/05/20.
//  Copyright © 2020 Rafael Nobre. All rights reserved.
//

import SwiftUI
import URLImage
import MDText

struct IssueDetailView: View {
    @ObservedObject var viewModel: IssueDetailViewModel
        
        init(viewModel: IssueDetailViewModel) {
            self.viewModel = viewModel
        }
        
        var body: some View {
            ScrollView {
                VStack {
                    VStack(alignment: .leading) {
                        Text(viewModel.title)
                            .font(.title)
                        HStack {
                            HStack {
                                avatarView
                                Text(viewModel.author)
                                    .fontWeight(.bold)
                                    .font(.headline)
                            }
                            Spacer()
                            Text(viewModel.date)
                                .font(.caption)
                        }
                        MDText(markdown: viewModel.description)
                            .font(.body)
                            .padding([.top, .bottom])
                    }
                    
                    Button(action: {
                        self.viewModel.openInGitHub()
                    }, label: {
                        HStack() {
                            Image(systemName: "square.and.arrow.up")
                                .font(.title)
                            Text("view-in-github")
                                .fontWeight(.semibold)
                                .font(.body)
                        }
                        .padding(24)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(40)
                    })
                }.padding()
            }
            .navigationBarTitle(Text(viewModel.navigationTitle),
                                      displayMode: .inline)
        }
    
    private var avatarView: some View {
        URLImage(viewModel.avatar,
                 placeholder: {
                    ProgressView($0) { progress in
                        ZStack {
                            if progress > 0 {
                                CircleProgressView(progress).stroke(lineWidth: 8)
                            }
                            else {
                                CircleActivityView().stroke(lineWidth: 8)
                            }
                        }
                    }
                    .frame(width: 32, height: 32)
        },
                 content: {
                    $0.image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 32, height: 32)
                        .clipShape(Circle())
                        .shadow(radius: 2)
        })
    }
}

#if DEBUG
struct IssueDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = IssueDetailViewModel(issue: .dummyOpen)
        return IssueDetailView(viewModel: viewModel)
    }
}
#endif
