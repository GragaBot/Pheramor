//
//  Profile.swift
//  PheramorTest
//
//  Created by T on 5/7/18.
//  Copyright © 2018 T. All rights reserved.
//

class ProfileInfo
{
    var email: String
    var password: String
    
    var firstname: String   // can user change their firstname later?
    var lastname: String
    var zipcode: Int
    var height: Int
    
    
    struct ProfileKeys{
        static let email = "email"
        static let password = "password"
        static let firstname = "firstname"
        static let lastname = "lastname"
        static let zipcode = "zipcode"
        static let height = "height"
    }
    
    struct newProfile{
        static var email: String = ""
        static var password: String = ""
        
        static var firstname: String = ""
        static var lastname: String = ""
        static var zipcode: Int = -1
        static var height: Int = -1
        
    }
    
    init(profileDict: [String:Any]){
        email = profileDict[ProfileKeys.email] as! String
        password = profileDict[ProfileKeys.password] as! String
        firstname = profileDict[ProfileKeys.firstname] as! String
        lastname = profileDict[ProfileKeys.lastname] as! String
        zipcode = profileDict[ProfileKeys.zipcode] as! Int
        height = profileDict[ProfileKeys.height] as! Int
    }
    
}

