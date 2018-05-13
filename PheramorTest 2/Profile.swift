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
        static var race: String = "N/A"
        static var religion: String = "N/A"
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
    init?(json:[String: Any]){
        guard let email = json["email"] as? String,
              let password = json["password"] as? String,
              let firstname = json["firstname"] as? String,
              let lastname = json["lastname"] as? String,
              let zipcode = json["zipcode"] as? Int,
              let height = json["height"] as? Int,
              let gender = json["gender"] as? String,
              let dob = json["dob"] as? String,
              let interestGender = json["interestGender"] as? String,
              let interestAge = json["interestAge"] as? [Int],
              let profileImage = json["profileImage"] as? String
            
            
        else {
            return nil
        }
        
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
        self.race = json["race"] as? String
        self.religion = json["religion"] as? String
        self.profileImage = profileImage
      
        
    }
    


}




struct Register : Encodable{
        let status: Bool
        let message: String
        
    
        init?(json: [String: Any]) {
          
            guard
                let status = json["status"] as? Bool,
                let message = json["message"] as? String
            
                else {
               
                    return nil
            }
            self.status = status
            self.message = message
            
        }
    
}

