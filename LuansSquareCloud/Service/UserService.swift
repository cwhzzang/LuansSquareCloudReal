//
//  UserService.swift
//  LuansSquareCloud
//
//  Created by cho wanhee on 2018. 9. 13..
//  Copyright © 2018년 cho wanhee. All rights reserved.
//

import Foundation
import Alamofire

class UserService{
    // Sample url: /gbiot/usr/iotuser/login.do
    
    static let sharedInstance=UserService()
    
    let baseURL: URL?
    
    var loginStatus:String?
    var loginUserModel:UserModel?
    
    
    init()
    {
        baseURL = URL(string: CommonUtill.getHttpAddress()+"/usr/iotuser")
    }
    
    
    /// 로그인 및 계정 정보 리턴
    ///
    /// - Parameters:
    ///   - userEmailId: <#userEmailId description#>
    ///   - password: <#password description#>
    ///   - completion: <#completion description#>
    func login(userEmailId: String, password: String, completion: @escaping (UserModel?) -> Void)
    {
        if let sendURL = URL(string: "\(baseURL!)/login.do?userid=\(userEmailId)&passwd=\(password)") {
            print(sendURL.absoluteString)
            Alamofire.request(sendURL).responseJSON(completionHandler: { (response) in
                
                switch response.result{
                    case .success(let responseValue):
                        do{
                            
                            print(responseValue)
                            let dataJSON=try JSONSerialization.data(withJSONObject: responseValue);
                            var userModel = try? JSONDecoder().decode(UserModel.self,from: dataJSON)
                            
                            if userModel?.successYN == "Y" {
                                //로그인 완료
                                self.loginUserModel=userModel
                                self.loginStatus="Y"
                                UserDefaults.standard.set(userEmailId, forKey: "userIdEmail")
                                UserDefaults.standard.set(password, forKey: "password")
                                //        UserDefaults.standard.set("", forKey: "userIdEmail")
                                //        UserDefaults.standard.set("", forKey: "password")
                                //        UserDefaults.standard.integer(forKey: "integerKeyName")
                                //        UserDefaults.standard.removeObject(forKey: "boolKeyName")
                                
                            }else{
                                //잘못된 로그인 정보
                                self.loginStatus="N"
                                self.loginUserModel=nil
                                UserDefaults.standard.removeObject(forKey: "userIdEmail")
                                UserDefaults.standard.removeObject(forKey: "password")
                            }
                            
                            completion(userModel)
                            
                        }catch{
                            print(error,"login 파싱중 에러")
                            completion(nil)
                        }
                        break
                    case .failure(let fail):
                        print(fail.localizedDescription)
                        completion(nil)
                        break
                }
                
            })
        }
    }
    
    /**
     * 사용 가능한 이메일인지 확인
     * @param userId
     * @return
     */
//    @GET("/gbiot/usr/iotuser/checkValidUserid.do")
//    Call<UserModel> checkValidUserId(@Query("userid") String userId);
    
    /// 사용 가능한 이메일인지 확인
    ///
    /// - Parameters:
    ///   - userEmailId: Email 주소
    ///   - completion: <#completion description#>
    func checkValidUserId(userEmailId: String, completion: @escaping (UserModel?) -> Void)
    {
        if let sendURL = URL(string: "\(baseURL!)/checkValidUserid.do?userid=\(userEmailId)") {
            print(sendURL.absoluteString)
            Alamofire.request(sendURL).responseJSON(completionHandler: { (response) in
                
                switch response.result{
                case .success(let responseValue):
                    do{
                        
                        print(responseValue)
                        let dataJSON=try JSONSerialization.data(withJSONObject: responseValue);
                        var userModel = try? JSONDecoder().decode(UserModel.self,from: dataJSON)
                        
                        completion(userModel)
                        
                    }catch{
                        print(error,"login 파싱중 에러")
                        completion(nil)
                    }
                    break
                case .failure(let fail):
                    print(fail.localizedDescription)
                    completion(nil)
                    break
                }
                
            })
        }
    }
    
    
    /**
     * 비밀 번호 분실시.
     * @param userId
     * @return
     */
    //    @GET("/gbiot/usr/iotuser/resetPasswd.do")
    //    Call<UserModel> checkValidUserId(@Query("userid") String userId);
    
    /// 미빌번호 분실
    ///
    /// - Parameters:
    ///   - userEmailId: Email 주소
    ///   - completion: <#completion description#>
    func resetPasswd(userEmailId: String, completion: @escaping (UserModel?) -> Void)
    {
        if let sendURL = URL(string: "\(baseURL!)/resetPasswd.do?userid=\(userEmailId)") {
            print(sendURL.absoluteString)
            Alamofire.request(sendURL).responseJSON(completionHandler: { (response) in
                
                switch response.result{
                case .success(let responseValue):
                    do{
                        
                        print(responseValue)
                        let dataJSON=try JSONSerialization.data(withJSONObject: responseValue);
                        var userModel = try? JSONDecoder().decode(UserModel.self,from: dataJSON)
                        
                        completion(userModel)
                        
                    }catch{
                        print(error,"resetPasswd 파싱중 에러")
                        completion(nil)
                    }
                    break
                case .failure(let fail):
                    print(fail.localizedDescription)
                    completion(nil)
                    break
                }
                
            })
        }
    }
    
    
    /**
     * LOG Out
     * @param userid
     * @return
     */
//    @GET("/gbiot/usr/iotuser/logout.do")
//    Call <UserModel> logout(@Query("userid") String userid);
    
    
    /// LOG Out
    ///
    /// - Parameters:
    ///   - userEmailId: <#userEmailId description#>
    ///   - password: <#password description#>
    ///   - completion: <#completion description#>
    func logout(userEmailId: String, completion: @escaping (UserModel?) -> Void)
    {
        if let sendURL = URL(string: "\(baseURL!)/logout.do?userid=\(userEmailId)") {
            print(sendURL.absoluteString)
            Alamofire.request(sendURL).responseJSON(completionHandler: { (response) in
                
                switch response.result{
                case .success(let responseValue):
                    do{
                        
                        print(responseValue)
                        let dataJSON=try JSONSerialization.data(withJSONObject: responseValue);
                        var userModel = try? JSONDecoder().decode(UserModel.self,from: dataJSON)
                        
                        completion(userModel)
                        
                    }catch{
                        print(error,"login 파싱중 에러")
                        completion(nil)
                    }
                    break
                case .failure(let fail):
                    print(fail.localizedDescription)
                    completion(nil)
                    break
                }
                
            })
        }
    }
    
    
    /**
     * 앱에서 계정 정보 업데이트 요청
     * @param userModel
     * @return
     */
//    @POST("/gbiot/usr/iotuser/update.do")
//    Call <UserModel> update(@Body UserModel userModel );
    
    
    /// 앱에서 계정 정보 업데이트 요청
    ///
    /// - Parameters:
    ///   - userEmailId: <#userEmailId description#>
    ///   - password: <#password description#>
    ///   - completion: <#completion description#>
    func updateUser(userModel: UserModel, completion: @escaping (UserModel?) -> Void)
    {
        
        
        
        if let sendURL = URL(string: "\(baseURL!)/update.do") {
            var request = URLRequest(url: sendURL)
            request.httpMethod = HTTPMethod.post.rawValue
            let jsonData = try?JSONEncoder().encode(userModel)
            request.httpBody = jsonData
            request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
            print(sendURL.absoluteString)
            Alamofire.request(request).responseJSON(completionHandler: { (response) in
                
                switch response.result{
                case .success(let responseValue):
                    do{
                        
                        print(responseValue)
                        let dataJSON=try JSONSerialization.data(withJSONObject: responseValue);
                        var userModel = try? JSONDecoder().decode(UserModel.self,from: dataJSON)
                        
                        if userModel?.successYN == "Y" {
                            //수정 완료
                            self.loginUserModel=userModel
                           
                            
                        }else{
                            //수정 실패
                          
                        }
                        
                        completion(userModel)
                        
                    }catch{
                        print(error,"login 파싱중 에러")
                        completion(nil)
                    }
                    break
                case .failure(let fail):
                    print(fail.localizedDescription)
                    completion(nil)
                    break
                }
                
            })
        }
    }
    
    
    
    /// 회원가입
    ///
    /// - Parameters:
    ///   - userEmailId: <#userEmailId description#>
    ///   - password: <#password description#>
    ///   - completion: <#completion description#>
    func registerUser(userModel: UserModel, completion: @escaping (UserModel?) -> Void)
    {
        
        
        
        if let sendURL = URL(string: "\(baseURL!)/register.do") {
            var request = URLRequest(url: sendURL)
            request.httpMethod = HTTPMethod.post.rawValue
            let jsonData = try?JSONEncoder().encode(userModel)
            request.httpBody = jsonData
            request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
            print(sendURL.absoluteString)
            Alamofire.request(request).responseJSON(completionHandler: { (response) in
                
                switch response.result{
                case .success(let responseValue):
                    do{
                        
                        print(responseValue)
                        let dataJSON=try JSONSerialization.data(withJSONObject: responseValue);
                        var userModel = try? JSONDecoder().decode(UserModel.self,from: dataJSON)
                        
                        if userModel?.successYN == "Y" {
                            //등록 완료
                            self.loginUserModel=userModel
                            
                            
                        }else{
                            //수정 실패
                            
                        }
                        
                        completion(userModel)
                        
                    }catch{
                        print(error,"login 파싱중 에러")
                        completion(nil)
                    }
                    break
                case .failure(let fail):
                    print(fail.localizedDescription)
                    completion(nil)
                    break
                }
                
            })
        }
    }
    
    
    

    
  
    
    
    
   
    
    
    
    
}
			
