//
//  InterestGenderAgeViewController.swift
//  PheramorTest
//
//  Created by T on 5/11/18.
//  Copyright © 2018 T. All rights reserved.
//

import UIKit
import HGCircularSlider

class InterestGenderAgeViewController: UIViewController, UIScrollViewDelegate, UIViewControllerTransitioningDelegate {

    @IBOutlet weak var nextStep: RoundedButton!
    @IBOutlet weak var ageRange: RangeCircularSlider!
    
    @IBOutlet weak var minAge: UILabel!
    
    @IBOutlet weak var maxAge: UILabel!
    
    
    @IBOutlet weak var scroll: UIScrollView!
    
    @IBOutlet weak var interestedGender: UILabel!
    var imageArray = [UIImage]()
    
    let lightpink = UIColor.init(red: 1, green: 138/255, blue: 216/255, alpha: 1)
    let lightblue = UIColor.init(red: 0, green: 156/255    , blue: 222/255, alpha: 1)
    let lightred = UIColor.init(red: 1, green: 93/255    , blue: 57/255, alpha: 1)
    let transition = CircularTransition()

    override func viewDidLoad() {
        super.viewDidLoad()
        scroll.layer.cornerRadius = (scroll.frame.size.width)/2
        scroll.delegate = self
        
        imageArray = [#imageLiteral(resourceName: "girl"),#imageLiteral(resourceName: "guy")]
        
        let w = scroll.frame.size.width
        for i in 0 ..< 2{
            let imageView = UIImageView()
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = imageView.frame.size.width/2
            imageView.image = imageArray[i]
            let xPosition = self.scroll.frame.width * CGFloat(i)
            imageView.frame = CGRect(x: xPosition, y: 0, width: w, height: w)
            scroll.contentSize.width = scroll.frame.width * CGFloat(i+1)
            scroll.addSubview(imageView)
        }
        
        ageRange.startThumbImage = UIImage(named: "baby")
        ageRange.endThumbImage = UIImage(named: "grownup")
        ageRange.startPointValue = 18
        ageRange.endPointValue = 50
        updateTexts(ageRange)
        // Do any additional setup after loading the view.
       
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView){
        let pageWidth = scrollView.frame.size.width;
        let currentPage = Int(floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1)
        
        
        if currentPage == 0 {

            interestedGender.text = "FEMALE"
            interestedGender.textColor = lightred
            

        } else {
            
            interestedGender.text = "MALE"
            interestedGender.textColor = lightblue
            
        }
        ProfileInfo.newProfile.interestGender = currentPage
        
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondVC = segue.destination as! RaceReligionViewController
        secondVC.transitioningDelegate = self
        secondVC.modalPresentationStyle = .custom
    }
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.startingPoint = nextStep.center
        transition.circleColor = nextStep.backgroundColor!
        
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = nextStep.center
        transition.circleColor = nextStep.backgroundColor!
        
        return transition
    }
    
    
    @IBAction func updateTexts(_ sender: Any) {
        if ageRange.startPointValue >= ageRange.endPointValue {
            minAge.textColor = UIColor.red
            maxAge.textColor = UIColor.red
        } else {
            minAge.textColor = lightpink
            maxAge.textColor = lightpink
        }
        
        minAge.text = String(Int(ageRange.startPointValue))
        maxAge.text = String(Int(ageRange.endPointValue))
        
        
    }
    
    @IBAction func nextStep(_ sender: Any) {
        if ageRange.startPointValue < ageRange.endPointValue {
            ProfileInfo.newProfile.interestAge[0] = Int(ageRange.startPointValue)
            
            ProfileInfo.newProfile.interestAge[1] = Int(ageRange.endPointValue)
            
        } else {
            Config.showAlerts(title:"Error", message: "Age Range Bad Format", handler: nil, controller: self )
        }
            
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
