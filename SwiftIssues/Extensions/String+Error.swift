//
//  String+Error.swift
//  SwiftIssues
//
//  Created by Rafael Nobre on 17/05/20.
//  Copyright © 2020 Rafael Nobre. All rights reserved.
//

import UIKit

extension String: LocalizedError {
    public var errorDescription: String? { return self }
}
