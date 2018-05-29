//
//  Profile.swift
//  PheramorTest
//
//  Created by T on 5/7/18.
//  Copyright © 2018 T. All rights reserved.
//

class ProfileInfo : Encodable
{
    let email: String!
    let password: String!
    
    let firstname: String!
    let lastname: String!
    let zipcode: Int!
    let height: Int!
    
    let dob: String!
    let gender: String!
    
    let interestGender: String!
    let interestAge: [Int]!
    
    var race: String?
    var religion: String?
    let profileImage:String!
    
    static var newUser: ProfileInfo?
    
    
    
    struct newProfile {
       
        
        static var email: String = ""
        static var password: String = ""
        
        static var firstname: String = ""
        static var lastname: String = ""
        static var zipcode: Int = -1
        static var height: Int = -1
        
        static var gender: String = ""
        static var dob: String = ""
        
        static var interestGender :String = "Female"
        static var interestAge = [-1, -1]
        static var race: String = ""
        static var religion: String = ""
        static var profileImage: String = ""
        
        
    }
    
    init(email:String!, password:String!, firstname:String!, lastname:String!, zipcode: Int!, height:Int!, gender: String!, dob:String!, interestGender: String!, interestAge: [Int]!, race: String?, religion: String?, profileImage: String!){
        
        self.email = email
        self.password = password
        self.firstname = firstname
        self.lastname = lastname
        self.zipcode = zipcode
        self.height = height
        self.gender = gender
        self.dob = dob
        self.interestGender = interestGender
        self.interestAge = interestAge
        self.race = race
        self.religion = religion
        self.profileImage = profileImage
        
    }
    var dictionaryRepresentation: [String: Any] {
        return [
            "email" : email,
            "password" :  password,
            "firstname" : firstname,
            "lastname" :  lastname,
            "zipcode" :  zipcode,
            "height" :  height,
            "gender" :  gender,
            "dob" :  dob,
            "interestGender" :  interestGender,
            "interestAge" :  interestAge,
            "race" :  race as Any,
            "religion" :  religion as Any,
            "profileImage" :  profileImage,
        ]
    }
}