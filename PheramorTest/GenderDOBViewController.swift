//
//  GenderDOBViewController.swift
//  PheramorTest
//
//  Created by T on 5/10/18.
//  Copyright © 2018 T. All rights reserved.
//

import UIKit
class GenderDOBViewController: UIViewController {
    @IBOutlet weak var boyImage: UIImageView!
    
    @IBOutlet weak var girlImage: UIImageView!
    
    @IBOutlet weak var dobPickerView: UIDatePicker!
    //@IBOutlet weak var genderL: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        girlImage.loadGif(name: "girlRun")

        boyImage.loadGif(name: "boyRun")
        print("here")
        //genderL.clipsToBounds = true
        //genderL.layer.cornerRadius = genderL.frame.size.height/2
        var today: Date {
            return (Calendar.current.date(byAdding: .weekOfYear, value: 0, to: Date())!)
        }
        dobPickerView.maximumDate = today
        
        if ProfileInfo.newProfile.gender == 1 {
            setBoy()
        } else if ProfileInfo.newProfile.gender == 0{
            setGirl()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickedBoy(_ sender: Any) {
        setBoy()
        //genderL.text = "M"
    }
    @IBAction func clickedGirl(_ sender: Any) {
        setGirl()
        //genderL.text = "F"

    }
    
    func setBoy(){
        boyImage.alpha = 1
        girlImage.alpha = 0.3
        boyImage.layer.borderWidth=5
        girlImage.layer.borderWidth = 3
        ProfileInfo.newProfile.gender = 1
    }
    func setGirl() {
        boyImage.alpha = 0.3
        girlImage.alpha = 1
        boyImage.layer.borderWidth=3
        girlImage.layer.borderWidth = 5
        ProfileInfo.newProfile.gender = 0
    }
    @IBAction func dismiss(_ sender: Any) {
         self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextStep(_ sender: Any) {
        if ProfileInfo.newProfile.gender == -1 {
            Config.showAlerts(title:"Error", message: "Please Enter Required Information", handler: nil, controller: self )
        } else {
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM dd yyyy"
            let selectedDate = dateFormatter.string(from: dobPickerView.date)
            
            ProfileInfo.newProfile.dob = selectedDate
            print(selectedDate)
            
        }
    }
    
}
