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
    
    var firstname: String   // can user change their name later?
    var lastname: String
    var zipcode: Int
    var height: Int
    
    var dob: String
    var gender: Int
    
    var interestGender: Int
    var interestAge: [Int]
    
    var race: Int?
    var religion: Int?
    
    struct ProfileKeys{
        static let email = "email"
        static let password = "password"
        static let firstname = "firstname"
        static let lastname = "lastname"
        static let zipcode = "zipcode"
        static let height = "height"
        
        static let dob = "dob"
        static let gender = "gender"
        static let interestGender = "interestGender"
        static let interestAge = "interestAge"
        static let religion = "religion"
        static let race = "race"
    }
    
    struct newProfile{
        static var email: String = ""
        static var password: String = ""
        
        static var firstname: String = ""
        static var lastname: String = ""
        static var zipcode: Int = -1
        static var height: Int = -1
        
        static var gender: Int = -1
        static var dob: String = ""
        
        static var interestGender = 0 
        static var interestAge = [-1, -1]
        static var race: Int = -1
        static var religion: Int = -1
        
        
    }
    
    init(profileDict: [String:Any]){
        email = profileDict[ProfileKeys.email] as! String
        password = profileDict[ProfileKeys.password] as! String
        firstname = profileDict[ProfileKeys.firstname] as! String
        lastname = profileDict[ProfileKeys.lastname] as! String
        zipcode = profileDict[ProfileKeys.zipcode] as! Int
        height = profileDict[ProfileKeys.height] as! Int
        dob = profileDict[ProfileKeys.dob] as! String
        gender = profileDict[ProfileKeys.gender] as! Int
        
        interestGender = profileDict[ProfileKeys.interestGender] as! Int
        interestAge = profileDict[ProfileKeys.interestAge] as! [Int]
        religion = profileDict[ProfileKeys.religion] as? Int
        race = profileDict[ProfileKeys.race] as? Int
        
    }
    
}
//https://jsonplaceholder.typicode.com/posts

