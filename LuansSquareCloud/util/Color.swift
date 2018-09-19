//
//  Color.swift
//  LuansSquareCloud
//
//  Created by cho wanhee on 2018. 9. 14..
//  Copyright © 2018년 cho wanhee. All rights reserved.
//

import UIKit

class Colors {
    
    let commonBgColor: CAGradientLayer
    
    init() {
        commonBgColor = CAGradientLayer()
        commonBgColor.colors = [
            UIColor(red:42/255, green:44/255, blue:68/255, alpha:1).cgColor, // Top
            UIColor(red:89/255, green:88/255, blue:159/255, alpha:1).cgColor // Bottom
        ]
        commonBgColor.startPoint = CGPoint(x: 0.0, y: 0)
        commonBgColor.endPoint = CGPoint(x: 1, y: 1)
    }
}
