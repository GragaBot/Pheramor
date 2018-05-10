//
//  EmailViewController.swift
//  PheramorTest
//
//  Created by T on 5/7/18.
//  Copyright © 2018 T. All rights reserved.
//

import UIKit


class EmailViewController: UIViewController, UIViewControllerTransitioningDelegate {

    @IBOutlet weak var setEmail: RoundedButton!
    @IBOutlet weak var email: RoundedTextField!
    @IBOutlet weak var visualEffect: UIVisualEffectView!
    
    let transition = CircularTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        visualEffect.clipsToBounds = true
        visualEffect.layer.cornerRadius = visualEffect.frame.size.height/2
       
        
       snowLove()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondVC = segue.destination as! PasswordViewController
        secondVC.transitioningDelegate = self
        secondVC.modalPresentationStyle = .custom
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.startingPoint = setEmail.center
        transition.circleColor = setEmail.backgroundColor!
        
        return transition
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = setEmail.center
        transition.circleColor = setEmail.backgroundColor!
        return transition
    }
    
    func snowLove(){
        let emitter = Animation.createEmitter(with: #imageLiteral(resourceName: "heart1"), with: kCAEmitterLayerLine, with: 0.3, with: 0.8, with: 180)
        emitter.emitterPosition = CGPoint(x: view.frame.width/2, y: 0)
        emitter.emitterSize = CGSize(width: view.frame.width, height: 2)
        
        view.layer.addSublayer(emitter)
        //emitter.emitterPosition
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
