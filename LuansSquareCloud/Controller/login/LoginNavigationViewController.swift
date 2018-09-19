//
//  LoginNavigationViewController.swift
//  LuansSquareCloud
//
//  Created by cho wanhee on 2018. 9. 14..
//  Copyright © 2018년 cho wanhee. All rights reserved.
//

import UIKit

class LoginNavigationViewController: UINavigationController {

    let colors = Colors()
    let naviTitleStr : String = "Login" .localized
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //제목 설정
        self.navigationItem.title = naviTitleStr
        //제목 색상변경
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        //기본 화면 설정
        self.drawDisplay()
    }
    
    func drawDisplay(){
        //Backgroud 변경
        view.backgroundColor = UIColor.clear
        var backgroundLayer = colors.commonBgColor
        backgroundLayer.frame = view.frame
        view.layer.insertSublayer(backgroundLayer, at: 0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
