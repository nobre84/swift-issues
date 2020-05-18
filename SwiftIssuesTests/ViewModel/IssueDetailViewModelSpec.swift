//
//  IssueDetailViewModelSpec.swift
//  SwiftIssuesTests
//
//  Created by Rafael Nobre on 18/05/20.
//  Copyright © 2020 Rafael Nobre. All rights reserved.
//

import XCTest
import Quick
import Nimble
import Cuckoo
@testable import SwiftIssues

class IssueDetailViewModelSpec: QuickSpec {

    override func spec() {
        
        describe("detail view model") {
            
            let urlOpener = MockURLOpener()
            var viewModel: IssueDetailViewModel!
            
            beforeEach {
                stub(urlOpener) { mock in
                    when(mock).open(any()).thenDoNothing()
                }
                viewModel = IssueDetailViewModel(issue: .dummyClosed,
                                                 urlOpener: urlOpener)
                
                clearInvocations(urlOpener)
            }
            
            it("has a title") {
                expect(viewModel.title) == Issue.dummyClosed.title
            }
            
            it("has a navigationTitle") {
                expect(viewModel.navigationTitle) == "#5678"
            }
            
            it("has description or empty string") {
                expect(viewModel.description) == Issue.dummyClosed.description ?? ""
            }
            
            it("has an author") {
                expect(viewModel.author) == Issue.dummyClosed.author.name
            }
            
            it("has an avatar URL") {
                expect(viewModel.avatar) == Issue.dummyClosed.author.avatarURL
            }
            
            context("when the device is in different locales") {
                
                beforeEach {
                    TimeZone.forceTimeZone(identifier: "Europe/London")
                    let issue = Issue.dummyClosed.adjustingDate(to: Date(timeIntervalSinceReferenceDate: 0))
                    viewModel = IssueDetailViewModel(issue: issue,
                                                     urlOpener: urlOpener)
                }
                
                afterEach {
                    Locale.resetLocale()
                    TimeZone.resetTimeZone()
                }
                
                it("has a US-formatted date") {
                    Locale.forceLocale(identifier: "en_US")
                    expect(viewModel.date) == "1/1/01, 12:00 AM"
                }
                
                it("has a Brazilian-formatted date") {
                    Locale.forceLocale(identifier: "pt_BR")
                    expect(viewModel.date) == "01/01/2001 00:00"
                }
            }
            
            it("opens the issue in GitHub") {
                viewModel.openInGitHub()
                verify(urlOpener).open(any())
            }
        }
        
    }

}
