//
//  AppDelegate.swift
//  LuansSquareCloud
//
//  Created by cho wanhee on 2018. 9. 11..
//  Copyright © 2018년 cho wanhee. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    
    
    override init() {
        
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //상단 STATUS BAR  색상 변경
        (UIApplication.shared.value(forKey: "statusBar") as AnyObject).setValue(UIColor.white, forKey: "foregroundColor")
        
      
        //        UserDefaults.standard.set("", forKey: "userIdEmail")
        //        UserDefaults.standard.set("", forKey: "password")
        //        UserDefaults.standard.integer(forKey: "integerKeyName")
        //        UserDefaults.standard.removeObject(forKey: "boolKeyName")
        if(UserService.sharedInstance.loginStatus != "Y"){
            //앱에 Login User 정보가 있는지 검사.
            if UserDefaults.standard.object(forKey: "userIdEmail") != nil {
                //있다면, Login
                var userIdEmailStr=UserDefaults.standard.string(forKey: "userIdEmail")
                var userPass=UserDefaults.standard.string(forKey: "password")
                
                UserService.sharedInstance.login(userEmailId: userIdEmailStr!, password: userPass!){
                                (loginUserModel) in
                    
                                if let loginUserModel = loginUserModel {
                                    DispatchQueue.main.async {
                                        if loginUserModel != nil {
                                            if loginUserModel.successYN == "Y" {
                                                //로그인 완료
                                                LoginViewControllerSwitcher.updateRootVC()
                                            }else{
                                                //잘못된 로그인 정보
                                                LoginViewControllerSwitcher.updateRootVC()
                                            }
                                        }else{
                                            //잘못된 로그인 정보
                                            LoginViewControllerSwitcher.updateRootVC()
                                        }
                                    }
                                }
                    
                            }
            }else{
                //잘못된 로그인 정보
                LoginViewControllerSwitcher.updateRootVC()
            }
        }
        
        sleep(1)
        print("Edit".localized)
        return true
       
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
    
    


} 

struct NewUserParams: DictionaryEncodable {
    
    var access_token: String?
    var email: String?
    var password: String?
    var name: String
    var phone_number: String
    var user_social_profile_image: Bool?
    var birthday: String?
    var bjdong_code: String?
    var referral: String?
    var push_id: String?
}


protocol DictionaryEncodable: Encodable {}

extension DictionaryEncodable {
    func dictionary() -> [String: Any]? {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .millisecondsSince1970
        guard let json = try? encoder.encode(self),
            let dict = try? JSONSerialization.jsonObject(with: json, options: []) as? [String: Any] else {
                return nil
        }
        return dict
    }
}

