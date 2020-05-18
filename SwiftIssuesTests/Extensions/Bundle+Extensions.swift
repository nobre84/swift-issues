//
//  Bundle+Extensions.swift
//  SwiftIssuesTests
//
//  Created by Rafael Nobre on 18/05/20.
//  Copyright © 2020 Rafael Nobre. All rights reserved.
//

import UIKit

extension Bundle {
    
    private static var ttt_currentLanguage: String?
    private static var ttt_swizzled = false
    
    public static func forceLanguage(_ identifier: String) {
        Bundle.ttt_currentLanguage = identifier
        exchangeCurrentLanguage()
    }
    
    public static func resetLanguage() {
        exchangeCurrentLanguage(undo: true)
    }
    
    private class func exchangeCurrentLanguage(undo: Bool = false) {
        
        guard Bundle.ttt_swizzled == undo else { return }
        
        Bundle.ttt_swizzled = !undo
        SwizzlingHelper.exchangeMethod(#selector(localizedString(forKey:value:table:)), with: #selector(myLocaLizedString(forKey:value:table:)), recipient: self)
    }

    @objc private func myLocaLizedString(forKey key: String,value: String?, table: String?) -> String {
        guard let currentLanguage = Bundle.ttt_currentLanguage,
            let bundlePath = Bundle.main.path(forResource: currentLanguage, ofType: "lproj"),
            let bundle = Bundle(path: bundlePath) else {
                return Bundle.main.myLocaLizedString(forKey: key, value: value, table: table)
        }
        return bundle.myLocaLizedString(forKey: key, value: value, table: table)
    }
}
