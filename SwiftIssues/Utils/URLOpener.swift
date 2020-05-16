//
//  URLOpener.swift
//  SwiftIssues
//
//  Created by Rafael Nobre on 16/05/20.
//  Copyright © 2020 Rafael Nobre. All rights reserved.
//

import Foundation
import UIKit

protocol URLOpener {
    func open(_ url: URL)
}

final class URLOpenerImpl: URLOpener {
    func open(_ url: URL) {
        UIApplication.shared.open(url)
    }
}

extension UIApplication: URLOpener {
    func open(_ url: URL) {
        open(url, options: [:], completionHandler: nil)
    }
}
