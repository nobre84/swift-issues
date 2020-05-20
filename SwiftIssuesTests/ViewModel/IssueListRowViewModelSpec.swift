//
//  IssueListRowViewModelSpec.swift
//  SwiftIssuesTests
//
//  Created by Rafael Nobre on 18/05/20.
//  Copyright © 2020 Rafael Nobre. All rights reserved.
//

import XCTest
import Quick
import Nimble
@testable import SwiftIssues

class IssueListRowViewModelSpec: QuickSpec {

    override func spec() {
        
        describe("row view model") {
            
            var viewModel: IssueListRowViewModel!
            
            beforeEach {
                viewModel = IssueListRowViewModel(issue: .dummyOpen)
            }
            
            afterEach {
                Locale.resetLocale()
                Bundle.resetLanguage()
            }
            
            it("has a title") {
                expect(viewModel.title) == Issue.dummyOpen.title
            }
            
            it("has an icon") {
                expect(viewModel.icon) == "issue_open"
            }
            
            it("sets the correct tint color") {
                expect(viewModel.iconColor) == .green
            }
            
            context("when localized in english") {
            
                beforeEach {
                    Locale.forceLocale(identifier: "en_US")
                    Bundle.forceLanguage("en")
                }
                
                it("has english subtitle") {
                    expect(viewModel.subtitle) == "#1234 opened 1 hour ago by John Doe"
                }
                
            }
            
            context("when localized in portuguese") {
            
                beforeEach {
                    Locale.forceLocale(identifier: "pt_BR")
                    Bundle.forceLanguage("pt-BR")
                }
                
                it("has portuguese subtitle") {
                    expect(viewModel.subtitle) == "#1234 aberta há 1 hora por John Doe"
                }
            }                        
        }
    }
    
}
