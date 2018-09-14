//
//  LoginViewController.swift
//  LuansSquareCloud
//
//  Created by cho wanhee on 2018. 9. 11..
//  Copyright © 2018년 cho wanhee. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
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
    
 
    

    
    
    @IBOutlet weak var userIdEmail: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    @IBAction func loginAction(_ sender: Any) {
        let userEmail=userIdEmail.text
        let userPwd=password.text
        
        if(userEmail=="" || userPwd==""){
            CommonUtill.showAlert(uiView: self, title: "입력", msg: "이메일 주소 또는 패스워드를 입력해 주세요")
        }else{
            //로그인 처리
            UserService.sharedInstance.login(userEmailId: userEmail!, password: userPwd!){
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
    }
    
    @IBAction func textFieldReturn(_ sender: Any) {
        (sender as AnyObject).resignFirstResponder()
    }
    
    @IBAction func pwdFieldReturn(_ sender: Any) {
        (sender as AnyObject).resignFirstResponder()
    }
    @IBAction func registerAction(_ sender: Any) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        userIdEmail.endEditing(true) // textBox는 textFiled 오브젝트 outlet 연동할때의 이름.
        password.endEditing(true)
    }

}
