// MARK: - Mocks generated from file: SwiftIssues/Utils/URLOpener.swift at 2020-05-18 15:19:35 +0000

//
//  URLOpener.swift
//  SwiftIssues
//
//  Created by Rafael Nobre on 16/05/20.
//  Copyright © 2020 Rafael Nobre. All rights reserved.
//

import Cuckoo
@testable import SwiftIssues

import Foundation
import UIKit


 class MockURLOpener: URLOpener, Cuckoo.ProtocolMock {
    
     typealias MocksType = URLOpener
    
     typealias Stubbing = __StubbingProxy_URLOpener
     typealias Verification = __VerificationProxy_URLOpener

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: URLOpener?

     func enableDefaultImplementation(_ stub: URLOpener) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func open(_ url: URL)  {
        
    return cuckoo_manager.call("open(_: URL)",
            parameters: (url),
            escapingParameters: (url),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.open(url))
        
    }
    

	 struct __StubbingProxy_URLOpener: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func open<M1: Cuckoo.Matchable>(_ url: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(URL)> where M1.MatchedType == URL {
	        let matchers: [Cuckoo.ParameterMatcher<(URL)>] = [wrap(matchable: url) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockURLOpener.self, method: "open(_: URL)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_URLOpener: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func open<M1: Cuckoo.Matchable>(_ url: M1) -> Cuckoo.__DoNotUse<(URL), Void> where M1.MatchedType == URL {
	        let matchers: [Cuckoo.ParameterMatcher<(URL)>] = [wrap(matchable: url) { $0 }]
	        return cuckoo_manager.verify("open(_: URL)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class URLOpenerStub: URLOpener {
    

    

    
     func open(_ url: URL)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}

