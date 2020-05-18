//
//  Locale+Force.swift
//
//  Created by Rafael Nobre on 05/06/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import Foundation

extension NSLocale {
    @nonobjc private static var ttt_locale = "en_US_POSIX"
    @nonobjc private static var ttt_swizzled = false
    
    @objc class func customizedCurrentLocale() -> NSLocale {
        return NSLocale(localeIdentifier: NSLocale.ttt_locale)
    }
    
    @objc class func customizedAutoupdatingLocale() -> NSLocale {
        return NSLocale(localeIdentifier: NSLocale.ttt_locale)
    }
    
    public class func forceLocale(identifier: String) {
        NSLocale.ttt_locale = identifier
        exchangeCurrentLocale()
    }
    
    public class func resetLocale() {
        exchangeCurrentLocale(undo: true)
    }
    
    private class func exchangeCurrentLocale(undo: Bool = false) {
        defer {
            NotificationCenter.default.post(name: NSLocale.currentLocaleDidChangeNotification, object: nil)
        }
        
        guard NSLocale.ttt_swizzled == undo else { return }
        
        NSLocale.ttt_swizzled = !undo
        
        SwizzlingHelper.exchangeClassMethod(#selector(getter: NSLocale.current), with: #selector(self.customizedCurrentLocale), recipient: self)
        SwizzlingHelper.exchangeClassMethod(#selector(getter: NSLocale.autoupdatingCurrent), with: #selector(self.customizedAutoupdatingLocale), recipient: self)
    }
    
}

extension Locale {
    public static func forceLocale(identifier: String) {
        NSLocale.forceLocale(identifier: identifier)
    }
    
    public static func resetLocale() {
        NSLocale.resetLocale()
    }
}
