//
//  ProfileViewController.swift
//  LuansSquareCloud
//
//  Created by cho wanhee on 2018. 9. 14..
//  Copyright © 2018년 cho wanhee. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    let colors = Colors()
    let naviTitleStr : String = "User Account Setting" .localized
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //제목 설정
        self.navigationItem.title = naviTitleStr
        //제목 색상변경
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        //기본 화면 설정
        self.drawDisplay()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func drawDisplay(){
        //Backgroud 변경
        view.backgroundColor = UIColor.clear
        var backgroundLayer = colors.commonBgColor
        backgroundLayer.frame = view.frame
        view.layer.insertSublayer(backgroundLayer, at: 0)
    }
    
    
    
    
    
    
    
    
    @IBOutlet weak var userEmailIdLabel: UILabel!
    
    @IBOutlet weak var currentPasswordInput: UITextField!
    
    @IBOutlet weak var newPasswordInput: UITextField!
    
    @IBOutlet weak var newPasswordRpInput: UITextField!
    
    @IBAction func setPasswordAction(_ sender: Any) {
        let userModel = UserService.sharedInstance.loginUserModel
        var newUserModel:UserModel=userModel!
        
        newUserModel.username = userModel?.username
        newUserModel.password = currentPasswordInput.text
        newUserModel.passwd = newPasswordInput.text
        
        UserService.sharedInstance.updateUser(userModel: newUserModel){
            (loginUserModel) in
            
            if let loginUserModel = loginUserModel {
                DispatchQueue.main.async {
                    if loginUserModel != nil {
                        if loginUserModel.successYN == "Y" {
                            //로그인 완료
                            LoginViewControllerSwitcher.updateRootVC()
                        }else{
                            CommonUtill.showAlert(uiView: self, title: "", msg: "입력한 정보가 올바르지 않습니다")
                        }
                    }else{
                        CommonUtill.showAlert(uiView: self, title: "", msg: "입력한 정보가 올바르지 않습니다")
                    }
                }
            }
        self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func setLogoutAction(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "password")
        UserDefaults.standard.removeObject(forKey: "userIdEmail")
        UserService.sharedInstance.loginStatus="N"
        LoginViewControllerSwitcher.updateRootVC()
    }
    
    @IBAction func setWithrowAction(_ sender: Any) {
        
    }
    
    
    

   

}
