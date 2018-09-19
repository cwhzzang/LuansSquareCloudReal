//
//  RegisterUserPasswordViewContollerViewController.swift
//  LuansSquareCloud
//
//  Created by cho wanhee on 2018. 9. 14..
//  Copyright © 2018년 cho wanhee. All rights reserved.
//

import UIKit

class RegisterUserPasswordViewContollerViewController: UIViewController {

    let colors = Colors()
    let naviTitleStr : String = "Register" .localized
    
    var emailAddress: String?
    var nationCode: String?
    
    @IBOutlet weak var pwdEdit1: UITextField!
    @IBOutlet weak var pwdEdit2: UITextField!
    
    @IBAction func nextActionBtn(_ sender: Any) {
        if(pwdEdit1.text=="" || pwdEdit2.text=="" || pwdEdit1.text != pwdEdit2.text){
            CommonUtill.showAlert(uiView: self, title: "Invalid Passwod" .localized, msg: self.emailAddress)
            pwdEdit1.setNeedsFocusUpdate()
            return;
        }
        
        var newUserModel:UserModel! = UserModel()
        newUserModel.userid = emailAddress
        newUserModel.password = pwdEdit1.text
        newUserModel.passwd = pwdEdit1.text
        newUserModel.nationNum = nationCode
        
        
        UserService.sharedInstance.registerUser(userModel: newUserModel){
            (loginUserModel) in
            
            if let loginUserModel = loginUserModel {
                DispatchQueue.main.async {
                    if loginUserModel != nil {
                        if loginUserModel.successYN == "Y" {
                            //등록 완료
                            CommonUtill.showAlert(uiView: self, title: "Register Complete. Check Emil Certify" .localized, msg: self.emailAddress)
                            
                            //잘못된 로그인 정보
                            LoginViewControllerSwitcher.updateRootVC()
                            
                        }else{
                            CommonUtill.showAlert(uiView: self, title: "System error" .localized, msg: self.emailAddress)
                        }
                    }else{
                        CommonUtill.showAlert(uiView: self, title: "System error" .localized, msg: self.emailAddress)
                    }
                }
            }
            self.dismiss(animated: true, completion: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //제목 설정
        self.navigationItem.title = naviTitleStr
        
        
        //제목 색상변경
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        //기본 화면 설정
        self.drawDisplay()
        CommonUtill.showAlert(uiView: self, title: "", msg: self.emailAddress)
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
