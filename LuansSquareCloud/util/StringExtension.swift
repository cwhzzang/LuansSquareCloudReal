//
//  StringExtension.swift
//  LuansSquareCloud
//
//  Created by cho wanhee on 2018. 9. 14..
//  Copyright © 2018년 cho wanhee. All rights reserved.
//


import Foundation


extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
