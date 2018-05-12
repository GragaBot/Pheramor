//
//  NameZipcodeHeightViewController.swift
//  PheramorTest
//
//  Created by T on 5/10/18.
//  Copyright © 2018 T. All rights reserved.
//

import UIKit
import Hero

class NameZipcodeHeightViewController: UIViewController {
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var gifView: UIImageView!
    
    
    @IBOutlet weak var firstName: RoundedTextField!
    
    @IBOutlet weak var lastName: RoundedTextField!
    @IBOutlet weak var zipcode: RoundedTextField!
    @IBOutlet weak var height: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gifView.loadGif(name: "calm-down")
        // Do any additional setup after loading the view.
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.doneClicked))
        
        toolBar.setItems([doneButton], animated: false)
        firstName.inputAccessoryView = toolBar
        lastName.inputAccessoryView = toolBar
        zipcode.inputAccessoryView = toolBar

    }
    @objc func doneClicked(){
        view.endEditing(true)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeHeight(_ sender: UISlider) {
        height.value = roundf(height.value)
        
        heightLabel.text = String(String(height.value) + " CM")
    }
    

    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextStep(_ sender: Any) {
        if firstName.text?.isEmpty == false  && zipcode.text?.isEmpty == false && lastName.text?.isEmpty == false{
            ProfileInfo.newProfile.firstname = firstName.text!
            ProfileInfo.newProfile.lastname = lastName.text!
            ProfileInfo.newProfile.zipcode = Int(zipcode.text!)!
            ProfileInfo.newProfile.height = Int(height.value)
            
            
            print(ProfileInfo.newProfile.firstname)
            print(ProfileInfo.newProfile.lastname)

            print(ProfileInfo.newProfile.zipcode)
            print(ProfileInfo.newProfile.height)

            
            
            //presentNext()
            
        }else {
            Config.showAlerts(title:"Error", message: "Please Enter Required Information", handler: nil, controller: self )
        }
        
    }
    
    
}
