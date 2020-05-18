//
//  GitHubService+Matchers.swift
//  SwiftIssuesTests
//
//  Created by Rafael Nobre on 18/05/20.
//  Copyright © 2020 Rafael Nobre. All rights reserved.
//

import Nimble
import Moya
@testable import SwiftIssues

func containRequestParam(_ expected: String?) -> Predicate<TargetType> {
    return Predicate { expression in
        guard let service = try expression.evaluate() else {
            return PredicateResult(status: .fail,
                                   message: .fail("failed evaluating expression"))
        }
        
        guard case .requestParameters(let params, _) = service.task else {
            return PredicateResult(status: .fail,
                                   message: .expectedActualValueTo("target to contain parameters"))
        }
        
        let actual = params["state"] as? String
        guard expected == actual else {
            return PredicateResult(status: .fail,
                                   message: .expectedCustomValueTo("contain <\(expected ?? "<nil>")> request param", actual ?? "<nil>"))
        }
        
        return PredicateResult(status: .matches,
                               message: .expectedTo("expectation fulfilled"))
        
    }
}
