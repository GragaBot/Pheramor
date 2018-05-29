//
//  PasswordViewController.swift
//  PheramorTest
//
//  Created by T on 5/8/18.
//  Copyright © 2018 T. All rights reserved.
//

import UIKit
import Foundation
import IHKeyboardAvoiding

class PasswordViewController: UIViewController {

    @IBOutlet weak var password: RoundedTextField!
    @IBOutlet weak var back: RoundedButton!
    
    @IBOutlet weak var forward: RoundedButton!
    @IBOutlet weak var slogan: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        snowLove()
       // gifView.loadGif(name: "gif")
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.doneClicked))
        
        toolBar.setItems([doneButton], animated: false)
        password.inputAccessoryView = toolBar
        KeyboardAvoiding.avoidingView = self.slogan
        //isHeroEnabled = true
        //forward.heroID = "toName"
        
    }
    @objc func doneClicked(){
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func snowLove(){
        let emitter = Animation.createEmitter(with: #imageLiteral(resourceName: "space-rocket"), with: kCAEmitterLayerLine, with: 0.8, with: 0.8, with: 1, with: 100)
        emitter.emitterPosition = CGPoint(x: view.frame.width/2, y: view.frame.height)
        emitter.emitterSize = CGSize(width: view.frame.width, height: 2)
        
        view.layer.addSublayer(emitter)
        //emitter.emitterPosition
    }
    @IBAction func dismissSecondVC(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
  
    @IBAction func next(_ sender: Any) {
        if password.text?.isEmpty == false {
            ProfileInfo.newProfile.password = password.text!
            
               // presentNext()
            
        }else {
             Config.showAlerts(title:"Error", message: "Please Enter Required Information", handler: nil, controller: self )
        }
        
    }
    
 
}
