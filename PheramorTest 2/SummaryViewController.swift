//
//  SummaryViewController.swift
//  PheramorTest
//
//  Created by T on 5/12/18.
//  Copyright © 2018 T. All rights reserved.
//

import UIKit

class SummaryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

   
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var profileImage: RoundedImageView!
    
    var keys = [Any]()
    var value = [Any]()
    var colors = [UIColor]()


    override func viewDidLoad() {
        super.viewDidLoad()

        /* either way works
         
        if let image = getSavedImage(named: "fileName") {
            profileImage.image = image
        } */
        let image = UIImage.imageWithBase64String(base64String: ProfileInfo.newProfile.profileImage)
        profileImage.image = image
       
        
        ProfileInfo.newUser = ProfileInfo.init(email: ProfileInfo.newProfile.email, password: ProfileInfo.newProfile.password, firstname: ProfileInfo.newProfile.firstname, lastname: ProfileInfo.newProfile.lastname, zipcode: ProfileInfo.newProfile.zipcode, height: ProfileInfo.newProfile.height, gender: ProfileInfo.newProfile.gender, dob: ProfileInfo.newProfile.dob, interestGender: ProfileInfo.newProfile.interestGender, interestAge: ProfileInfo.newProfile.interestAge, race: ProfileInfo.newProfile.race, religion: ProfileInfo.newProfile.religion, profileImage: ProfileInfo.newProfile.profileImage)
        let elementss = ProfileInfo.newUser
        
        
        let mirror = Mirror(reflecting: elementss!)
        for child in mirror.children{
            keys.append(child.label!)
            value.append(child.value)
            //print("key: \(String(describing: child.label)), value: \(child.value)")
        }
        //print(keys)
        //print(value)
        self.tableView.dataSource = self
        
        self.tableView.delegate = self
        
        self.tableView.reloadDataWithAnimate(animationTime: 1, interval: 0.1)
        
        for i in 0 ..< 13 {
            let math = CGFloat(222 - (10 * i))
            let lightblue = UIColor.init(red: 0, green: 156/255    , blue: math/255, alpha: 1)
            
            colors.append(lightblue)
        }


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return keys.count-1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "summary", for: indexPath) as! SummaryTableViewCell
        cell.keys.text = String(describing: keys[indexPath.row])
        cell.values.text = String(describing: value[indexPath.row])
        cell.layer.cornerRadius = cell.layer.frame.size.height/2
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.borderWidth = 3
        cell.backgroundColor = colors[indexPath.row]
        return cell
    }
    
    func getSavedImage(named: String) -> UIImage? {
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
            return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named).path)
        }
        return nil
    }
    
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)

    }
    

}

class SummaryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var keys: UILabel!
    
    @IBOutlet weak var values: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

extension UITableView {
  
    func reloadDataWithAnimate(animationTime:TimeInterval,interval:TimeInterval)->Void{
        self.setContentOffset(self.contentOffset, animated: false)
        UIView.animate(withDuration: 0.2, animations: { () -> Void in
            self.isHidden = true
            self.reloadData()
        }, completion: { (finished) -> Void in
            self.isHidden = false
            self.visibleRowsBeginAnimation(animationTime: animationTime, interval: interval)
        })
    }
    func visibleRowsBeginAnimation(animationTime:TimeInterval,interval:TimeInterval)->Void{
        let visibleArray : NSArray = self.indexPathsForVisibleRows! as NSArray
        let count =  visibleArray.count
    
        for i in 0...(count-1){
            let path : IndexPath = visibleArray.object(at: i) as! IndexPath
            let cell : UITableViewCell = self.cellForRow(at: path)!
            cell.isHidden = true
            let originPoint : CGPoint = cell.center
            cell.center = CGPoint(x: -cell.frame.size.width,  y: originPoint.y)
            UIView.animate(withDuration: animationTime + TimeInterval(i) * interval, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: { () -> Void in
                cell.center = CGPoint(x: originPoint.x - 2.0,  y: originPoint.y)
                cell.isHidden = false;
            }, completion: { (finished) -> Void in
                UIView.animate(withDuration: 0.1, delay: 0, options: UIViewAnimationOptions.curveEaseIn, animations: { () -> Void in
                    cell.center = CGPoint(x: originPoint.x + 2.0,  y: originPoint.y)
                }, completion: { (finished) -> Void in
                    UIView.animate(withDuration: 0.1, delay: 0, options: UIViewAnimationOptions.curveEaseIn, animations: { () -> Void in
                        cell.center = originPoint
                    }, completion: { (finished) -> Void in
                        
                    })
                })
            })
        }
    }
    
}



