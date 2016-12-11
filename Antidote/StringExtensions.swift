//
//  StringExtensions.swift
//  Antidote
//
//  Created by Yoba on 12/12/2016.
//  Copyright © 2016 Dmytro Vorobiov. All rights reserved.
//

import Foundation

extension String {
    init(localized: String, _ arguments: CVarArg...) {
        let format = NSLocalizedString(localized, tableName: nil, bundle: Bundle.main, value: "", comment: "")
        self.init(format: format, arguments: arguments)
    }
}
