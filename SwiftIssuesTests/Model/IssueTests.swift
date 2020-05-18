//
//  IssueTests.swift
//  SwiftIssuesTests
//
//  Created by Rafael Nobre on 16/05/20.
//  Copyright © 2020 Rafael Nobre. All rights reserved.
//

import XCTest
import Nimble

class IssueTests: XCTestCase {
    
    override func setUpWithError() throws {
        Locale.forceLocale(identifier: "pt_BR")
    }

    override func tearDownWithError() throws {
        Locale.resetLocale()
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
