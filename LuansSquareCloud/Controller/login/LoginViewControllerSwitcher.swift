//
//  LoginViewControllerSwitcher.swift
//  LuansSquareCloud
//
//  Created by cho wanhee on 2018. 9. 11..
//  Copyright © 2018년 cho wanhee. All rights reserved.
//

import Foundation
import UIKit

class LoginViewControllerSwitcher {
    static func updateRootVC(){
        
        
        var rootVC : UIViewController?
        
        print(UserService.sharedInstance.loginStatus)
        
        
        if(UserService.sharedInstance.loginStatus != nil && UserService.sharedInstance.loginStatus=="Y"){
            rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainTabViewControllerID") as! MainTabViewController
        }else{
            rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginNavigationViewControllerID") as! LoginNavigationViewController
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = rootVC
        
    }
}
