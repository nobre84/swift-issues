//
//  IssueListViewModelSpec.swift
//  SwiftIssuesTests
//
//  Created by Rafael Nobre on 17/05/20.
//  Copyright © 2020 Rafael Nobre. All rights reserved.
//

import XCTest
import Quick
import Nimble
import OHHTTPStubs
import Moya
@testable import SwiftIssues

class IssueListViewModelSpec: QuickSpec {
    
    override func spec() {
        
        beforeEach {
            HTTPStubs.onStubActivation { request, stub, _ in
                print("Stubbing \(request) with \(stub)")
            }
        }
        
        afterEach {
            HTTPStubs.removeAllStubs()
        }
        
        describe("state") {
            var viewModel: IssueListViewModel!
            beforeEach {
                stub(condition: isHost(GitHubService.host)) { _ in
                    return HTTPStubsResponse(data: "[]".utf8Encoded,
                                             statusCode:200,
                                             headers:nil)
                }
                // Apparently this should work instead of the empty stub above, but Moya is still reaching the network and not supplying the target's sampleData ¯\_(ツ)_/¯
                // viewModel = IssueListViewModel(provider: MoyaProvider<GitHubService>(stubClosure: MoyaProvider.immediatelyStub))
                viewModel = IssueListViewModel()
            }
            
            it("should start as loading") {
                expect(viewModel.state) == .loading
            }
            
            it("should change to ready after fetching data") {
                viewModel.fetchIssues()
                expect(viewModel.state).toEventually(equal(.ready([])))
            }
            
            context("when there is a server error") {
                
                let error = "Localized error message from any thrown error"
                beforeEach {
                    // This should also work, but Moya is acting up...
//                    let serverErrorEndpointClosure = { (target: GitHubService) -> Endpoint in
//                      return Endpoint(url: URL(target: target).absoluteString,
//                                      sampleResponseClosure: { .networkResponse(500 , Data()) },
//                                      method: target.method,
//                                      task: target.task,
//                                      httpHeaderFields: target.headers)
//                    }
//                    let errorProvider = MoyaProvider<GitHubService>(endpointClosure: serverErrorEndpointClosure,
//                                                                    stubClosure: MoyaProvider.immediatelyStub)
                    stub(condition: isHost(GitHubService.host)) { _ in
                        return HTTPStubsResponse(error: error)
                    }
                    viewModel = IssueListViewModel()
                }
                
                it("should change to error state") {
                    viewModel.fetchIssues()
                    expect(viewModel.state.isError).toEventually(beTrue())
                }
            }
            
            context("when server sends unparsable data") {
                
                beforeEach {
                    stub(condition: isHost(GitHubService.host)) { _ in
                        return HTTPStubsResponse(data: Data(),
                                                 statusCode: 200,
                                                 headers: nil)
                    }
                    viewModel = IssueListViewModel()
                }
                
                it("should change to error state") {
                    viewModel.fetchIssues()
                    expect(viewModel.state.isError).toEventually(beTrue())
                }
            }
        }
    }

}
