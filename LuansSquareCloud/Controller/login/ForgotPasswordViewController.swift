//
//  ForgotPasswordViewController.swift
//  LuansSquareCloud
//
//  Created by cho wanhee on 2018. 9. 19..
//  Copyright © 2018년 cho wanhee. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    let colors = Colors()
    let naviTitleStr : String = "Forgot Password" .localized
    
    @IBOutlet weak var emailAddressEdit: UITextField!
    
    @IBAction func resetPasswordAction(_ sender: Any) {
        let userEmail=emailAddressEdit.text
       
        
        if(userEmail==""){
            CommonUtill.showAlert(uiView: self, title: "", msg: "Input Email Address" .localized)
            return
        }else{
            //비밀 번호 분실 처리
            UserService.sharedInstance.resetPasswd(userEmailId: userEmail!){
                (loginUserModel) in
                
                if let loginUserModel = loginUserModel {
                    DispatchQueue.main.async {
                        if loginUserModel != nil {
                            if loginUserModel.successYN == "Y" {
                                //로그인 완료
                                
                                CommonUtill.showAlert(uiView: self, title: "", msg: "You have sent an authentication email to a registered email." .localized)
                                
                                LoginViewControllerSwitcher.updateRootVC()
                            }else{
                                CommonUtill.showAlert(uiView: self, title: "System error" .localized, msg: "System error" .localized)
                            }
                        }else{
                            CommonUtill.showAlert(uiView: self, title: "System error" .localized, msg: "System error" .localized)
                        }
                    }
                }
                self.dismiss(animated: true, completion: nil)
            }
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
