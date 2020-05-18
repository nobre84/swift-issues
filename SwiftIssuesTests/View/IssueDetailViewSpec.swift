//
//  IssueDetailViewSpec.swift
//  SwiftIssuesTests
//
//  Created by Rafael Nobre on 18/05/20.
//  Copyright © 2020 Rafael Nobre. All rights reserved.
//

import XCTest
import Quick
import Nimble
import OHHTTPStubs
import ViewInspector
@testable import SwiftIssues

class IssueDetailViewSpec: QuickSpec {

    override func spec() {
        
        describe("detail view") {
            
            var detailView: IssueDetailView!
            var viewModel: IssueDetailViewModel!
            
            beforeEach {
                viewModel = IssueDetailViewModel(issue: .dummyClosed)
                detailView = IssueDetailView(viewModel: viewModel)
            }
            
            it("can scroll its contents") {
                expect {
                    try detailView.body.inspect().scrollView()
                }.notTo(throwError())
            }
            
            it("has a title at the top") {
                expect {
                    try detailView.body.inspect().scrollView().vStack().vStack(0).text(0)
                }.notTo(throwError())
            }
        }
        
    }
}
