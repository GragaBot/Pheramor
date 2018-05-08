//
//  EmailViewController.swift
//  PheramorTest
//
//  Created by T on 5/7/18.
//  Copyright © 2018 T. All rights reserved.
//

import UIKit

class EmailViewController: UIViewController {

    @IBOutlet weak var setEmail: RoundedButton!
    @IBOutlet weak var email: RoundedTextField!
    @IBOutlet weak var visualEffect: UIVisualEffectView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        visualEffect.clipsToBounds = true
        visualEffect.layer.cornerRadius = visualEffect.frame.size.height/2
        visualEffect.layer.borderColor = UIColor.white.cgColor
        visualEffect.layer.borderWidth = 3
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func next(_ sender: Any) {
        
        if (email.text?.isValidEmail())!{
            
            ProfileInfo.newProfile.email = email.text!
            
        } else {
            
            Config.showAlerts(title:"Error", message: "Please Enter Required Information", handler: nil, controller: self )
            
            //print("here")
        }
       
        
        //print(ProfileInfo.newProfile)
    }
    

}
extension String {
    func isValidEmail() -> Bool {
        // here, `try!` will always succeed because the pattern is valid
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
}