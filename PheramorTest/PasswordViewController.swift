//
//  PasswordViewController.swift
//  PheramorTest
//
//  Created by T on 5/8/18.
//  Copyright © 2018 T. All rights reserved.
//

import UIKit


class PasswordViewController: UIViewController {

    @IBOutlet weak var back: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissSecondVC(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
  

}
