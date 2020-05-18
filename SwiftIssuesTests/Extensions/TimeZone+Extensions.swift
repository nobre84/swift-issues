//
//  TimeZone+Force.swift
//
//  Created by Rafael Nobre on 05/06/19.
//  Copyright © 2019 Rafael Nobre. All rights reserved.
//

import Foundation

extension NSTimeZone {
    
    @nonobjc private static var ttt_timeZone: NSTimeZone!
    @nonobjc private static var ttt_swizzled = false
    
    @objc private class func customizedCurrentTimeZone() -> NSTimeZone {
        return ttt_timeZone
    }
    
    @objc private class func customizedAutoupdatingTimeZone() -> NSTimeZone {
        return ttt_timeZone
    }
    
    public class func forceTimeZone(identifier: String) {
        NSTimeZone.forceTimeZone(NSTimeZone(name: identifier)!)
    }
    
    public class func forceTimeZone(_ timeZone: NSTimeZone) {
        NSTimeZone.ttt_timeZone = timeZone
        exchangeCurrentTimeZone()
    }
    
    public class func resetTimeZone() {
        exchangeCurrentTimeZone(undo: true)
    }
    
    private class func exchangeCurrentTimeZone(undo: Bool = false) {
        defer {
            NotificationCenter.default.post(name: .NSSystemTimeZoneDidChange, object: nil)
        }
        
        guard NSTimeZone.ttt_swizzled == undo else { return }
        
        NSTimeZone.ttt_swizzled = !undo
        
        SwizzlingHelper.exchangeClassMethod(#selector(getter: NSTimeZone.system), with: #selector(self.customizedCurrentTimeZone), recipient: self)
        SwizzlingHelper.exchangeClassMethod(#selector(getter: NSTimeZone.local), with: #selector(self.customizedAutoupdatingTimeZone), recipient: self)
    }
    
}

extension TimeZone {
    
    public static func forceTimeZone(identifier: String) {
        NSTimeZone.forceTimeZone(identifier: identifier)
    }
    
    public static func forceTimeZone(_ timeZone: TimeZone) {
        NSTimeZone.forceTimeZone(timeZone as NSTimeZone)
    }
    
    public static func resetTimeZone() {
        NSTimeZone.resetTimeZone()
    }
    
}
