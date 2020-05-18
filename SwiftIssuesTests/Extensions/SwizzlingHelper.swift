//
//  SwizzlingHelper.swift
//
//  Created by Rafael Nobre on 05/06/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import Foundation

class SwizzlingHelper {

    static func exchangeMethod(_ original: Selector, with replacement: Selector, recipient: AnyClass?) {
        guard let originalMethod = class_getInstanceMethod(recipient, original),
            let swizzledMethod = class_getInstanceMethod(recipient, replacement) else { return print("exchangeClassMethod failed") }
        
        method_exchangeImplementations(originalMethod, swizzledMethod)
    }

    
    static func exchangeClassMethod(_ original: Selector, with replacement: Selector, recipient: AnyClass?) {
        guard let originalMethod = class_getClassMethod(recipient, original),
            let swizzledMethod = class_getClassMethod(recipient, replacement) else { return print("exchangeClassMethod failed") }
        
        method_exchangeImplementations(originalMethod, swizzledMethod)
    }

}
