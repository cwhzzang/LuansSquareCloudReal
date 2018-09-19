//
//  RegisterUserViewController.swift
//  LuansSquareCloud
//
//  Created by cho wanhee on 2018. 9. 14..
//  Copyright © 2018년 cho wanhee. All rights reserved.
//

import UIKit

class RegisterUserViewController: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource
{
    
    
    var selectRow = 0
    var Array = ["대한민국(82)","미국(233)","일본(82)","중국(82)"]
    var selectVar = ""
    
    
    let colors = Colors()
    let naviTitleStr : String = "Register" .localized
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //제목 설정
        self.navigationItem.title = naviTitleStr
        
       
        //제목 색상변경
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        //기본 화면 설정
        self.drawDisplay()
        
        picker.delegate = self
        picker.dataSource = self
        
        
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
    
    
    
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var emalAddrestText: UITextField!
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Array.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int,forComponent component:Int) -> String? {
        return Array[row]
    }
    
    func pickerView(_ pickerView:UIPickerView, didSelectRow row:Int, inComponent component:Int){
        selectVar = Array[row]
    }
    
    
    
    
    @IBAction func nextAction(_ sender: Any) {
        if(emalAddrestText.text! == "" ){
            CommonUtill.showAlert(uiView: self, title: "", msg: "Input Email Address" .localized)
            emalAddrestText.setNeedsFocusUpdate()
            return
        }
        
        if(!CommonUtill.isValidEmail(testStr: emalAddrestText.text!)){
            CommonUtill.showAlert(uiView: self, title: "", msg: "Invalid Email Address" .localized)
            emalAddrestText.setNeedsFocusUpdate()
            return
        }
        
        
        //벨레데이션 처리
        UserService.sharedInstance.checkValidUserId(userEmailId: emalAddrestText.text!){
            (loginUserModel) in
            
            if let loginUserModel = loginUserModel {
                DispatchQueue.main.async {
                    if loginUserModel != nil {
                        if loginUserModel.successYN == "Y" {
                           
                            self.performSegue(withIdentifier: "RegisterUserPasswordViewContollerViewControllerNextView", sender: self)
                            ;
                            
                            
//                            CommonUtill.showAlert(uiView: self, title: "", msg: self.selectVar)
//                            CommonUtill.showAlert(uiView: self, title: "", msg: "사용가능")
                        }else{
                            CommonUtill.showAlert(uiView: self, title: "", msg: "Aleady Exists Email"  .localized)
                        }
                    }else{
                        CommonUtill.showAlert(uiView: self, title: "", msg: "Aleady Exists Email" .localized)
                    }
                }
            }
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let pwdView=segue.destination as! RegisterUserPasswordViewContollerViewController
        pwdView.emailAddress = emalAddrestText.text;
        pwdView.nationCode = self.selectVar;
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        emalAddrestText.endEditing(true) // textBox는 textFiled 오브젝트 outlet 연동할때의 이름.
      
    }
    
    @IBAction func emailAddressReturnEvent(_ sender: Any) {
        emalAddrestText.endEditing(true)
    }
}
