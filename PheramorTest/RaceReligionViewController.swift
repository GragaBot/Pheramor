//
//  RaceReligionViewController.swift
//  PheramorTest
//
//  Created by T on 5/11/18.
//  Copyright © 2018 T. All rights reserved.
//

import UIKit

class RaceReligionViewController: UIViewController {
    var race = dropDownBtn()
    var religion = dropDownBtn()
    
    let lightpink = UIColor.init(red: 1, green: 138/255, blue: 216/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addRaceButton()
        addReligionButton()
        race.setupDropView()
        religion.setupDropView()
    }
 
   
    func addReligionButton(){
        //Configure the button
        religion = dropDownBtn.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        religion.setTitle("Religion", for: .normal)
        religion.titleLabel?.font =  UIFont(name: "Black", size: 30)
        
        religion.backgroundColor = lightpink
        religion.translatesAutoresizingMaskIntoConstraints = false
        
        //Add Button to the View Controller
        self.view.addSubview(religion)
        
        //button Constraints
        religion.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: self.view.frame.width/4).isActive = true
        religion.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -self.view.frame.height/4).isActive = true
        religion.widthAnchor.constraint(equalToConstant: 160).isActive = true
        religion.heightAnchor.constraint(equalToConstant: 50).isActive = true
        religion.clipsToBounds = true
        self.religion.layer.cornerRadius = 25
        //Set the drop down menu's options
        religion.dropView.dropDownOptions = [ "Christianity", "Gnosticism", "Islam", "Judaism", "Buddhism", "Hinduism","Others","None","N/A"]
        
        // Do any additional setup after loading the view.
    }
    
    func addRaceButton(){
        race = dropDownBtn.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        race.setTitle("Race", for: .normal)
        race.titleLabel?.font =  UIFont(name: "Black", size: 20)
        
        race.backgroundColor = lightpink
        race.translatesAutoresizingMaskIntoConstraints = false
        
        //Add Button to the View Controller
        self.view.addSubview(race)
        
        //button Constraints
        race.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -self.view.frame.width/4).isActive = true
        race.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -self.view.frame.height/4).isActive = true
        race.widthAnchor.constraint(equalToConstant: 160).isActive = true
        race.heightAnchor.constraint(equalToConstant: 50).isActive = true
        race.clipsToBounds = true
        self.race.layer.cornerRadius = 25
        //Set the drop down menu's options
        race.dropView.dropDownOptions = [ "American Indian", "Asian", "African American", "Hispanic or Latino", "Native Hawaiian", "White", "N/A"]
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func nextStep(_ sender: Any) {
        if (self.race.titleLabel?.isEqual("Race"))! {
            ProfileInfo.newProfile.race = "N/A"
        } else {
            ProfileInfo.newProfile.race = self.race.title(for: .normal)!
        }
        if (self.religion.titleLabel?.isEqual("Religion"))!{
            ProfileInfo.newProfile.religion = "N/A"
        } else {
            ProfileInfo.newProfile.religion = self.religion.title(for: .normal)!
        }

        
        print(race)
    }
    
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)

    }
    
    
/*
    @IBAction func uploadData(_ sender: Any) {
        
        guard let url = URL(string: "https://external.dev.pheramor.com/") else { return}
        //"https://jsonplaceholder.typicode.com/posts"
        var request = URLRequest(url:url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let postDictionary = ["email" : ProfileInfo.newProfile.email,
                              "password" : ProfileInfo.newProfile.password,
                              "firstname": ProfileInfo.newProfile.firstname,
                              "lastname" : ProfileInfo.newProfile.lastname]
        do{
            let jsonBody = try JSONSerialization.data(withJSONObject: postDictionary, options: [])
            request.httpBody = jsonBody
            print(jsonBody)
        }catch{}
        
            
        let session = URLSession.shared
        session.dataTask(with: request) {
            (data, response,error) in
            if error != nil {
                print(error)
                return
            }
            let str = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print(str)
            guard let data = data else { print("nodata")
                return}
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            } catch{}
        }.resume()
        
        /*
         let session = URLSession.shared
         let task = session.dataTask(with: request, completionHandler: (Data, response, error)) {
         guard let data = data else {return}
         do {
         let json = try JSONSerialization.jsonObject(with: data, options: [])
         print(json)
         } catch{}
         }.resume()*/
        
        
        
    }*/
    
    

}
