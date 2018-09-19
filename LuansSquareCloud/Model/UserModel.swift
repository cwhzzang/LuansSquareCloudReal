//
//  UserDto.swift
//  LuansSquareCloud
//
//  Created by cho wanhee on 2018. 9. 12..
//  Copyright © 2018년 cho wanhee. All rights reserved.
//

import UIKit

struct UserModel: Codable {
    
    
//    @SerializedName("passwd") @Expose String passWD;
//    @SerializedName("nationNum") @Expose String nationMum;
//    @SerializedName("pushId") @Expose String pushId;
//    @SerializedName("osVer") @Expose String osVer;
//    @SerializedName("phone") @Expose String phone;
//    @SerializedName("userid") @Expose String userId;
//    @SerializedName("successYN") @Expose String successYN;
//    @SerializedName("msg") @Expose String msg;
//    @SerializedName("regDate") @Expose String regDate;
//    @SerializedName("lastUpdate") @Expose String lastUpdate;
//    @SerializedName("confirmDate") @Expose String confirmDate;
//    @SerializedName("access_token") @Expose String access_token;
//    @SerializedName("grant_type") @Expose String grant_type;
//    @SerializedName("password") @Expose String password;
//    @SerializedName("username") @Expose String username;
    
//    @SerializedName("gbUsrNo") @Expose int gbUsrNo;
//    @SerializedName("osType") @Expose int osType;
    
    var passwd: String?
    var nationNum: String?
    var pushId: String?
    var osVer: String?
    var phone: String?
    var userid: String?
    var successYN: String?
    var msg: String?
    var regDate: String?
    var lastUpdate: String?
    var confirmDate: String?
    var access_token: String?
    var grant_type: String?
    var password: String?
    var username: String?
    
    var gbUsrNo : IntegerLiteralType?
    var osType : IntegerLiteralType?
    
    //값이 없을 경우를 위하여 cwh
    enum CodingKeys:String,CodingKey{
        case passwd,nationNum,pushId,osVer,phone,userid,successYN,msg,regDate,lastUpdate,confirmDate,access_token,grant_type,password,username,gbUsrNo,osType
    }
    
    //처음 진입시, 초기값 셋팅 cwh
    init(from decoder:Decoder) throws{
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        passwd = try values.decodeIfPresent(String.self, forKey: .passwd)
        nationNum = try values.decodeIfPresent(String.self, forKey: .nationNum)
        pushId = try values.decodeIfPresent(String.self, forKey: .pushId)
        osVer = try values.decodeIfPresent(String.self, forKey: .osVer)
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
        userid = try values.decodeIfPresent(String.self, forKey: .userid)
        successYN = try values.decodeIfPresent(String.self, forKey: .successYN)
        msg = try values.decodeIfPresent(String.self, forKey: .msg)
        regDate = try values.decodeIfPresent(String.self, forKey: .regDate)
        lastUpdate = try values.decodeIfPresent(String.self, forKey: .lastUpdate)
        confirmDate = try values.decodeIfPresent(String.self, forKey: .confirmDate)
        access_token = try values.decodeIfPresent(String.self, forKey: .access_token)
        grant_type = try values.decodeIfPresent(String.self, forKey: .grant_type)
        password = try values.decodeIfPresent(String.self, forKey: .password)
        username = try values.decodeIfPresent(String.self, forKey: .username)
        gbUsrNo = try values.decodeIfPresent(Int.self, forKey: .gbUsrNo)
        osType = try values.decodeIfPresent(Int.self, forKey: .osType)
    }
    
    init() {}
    
    
}
