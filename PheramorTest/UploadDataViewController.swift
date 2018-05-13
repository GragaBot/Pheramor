//
//  UploadDataViewController.swift
//  PheramorTest
//
//  Created by T on 5/11/18.
//  Copyright © 2018 T. All rights reserved.
//

import UIKit

class UploadDataViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //uploadData()
        snowLove()
        upload()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    func upload(){
        
        
        let jsonEncoder = JSONEncoder()
        guard let url = URL(string: "https://external.dev.pheramor.com/") else { return}
        //"https://jsonplaceholder.typicode.com/posts"
        //"https://external.dev.pheramor.com"
        let session = URLSession.shared

        var request = URLRequest(url:url)
        request.httpMethod = "POST"
        //request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        //request.addValue("application/json", forHTTPHeaderField: "Accept")
        do {
            let jsonData = try jsonEncoder.encode(ProfileInfo.newUser)
            
            
            let jsonString = String(data: jsonData, encoding: .utf8)
            print(jsonString!)
            
            
            let jsonDatas = jsonString?.data(using: .utf8)
            let dictionary = try? JSONSerialization.jsonObject(with: jsonDatas!, options: .mutableLeaves)
            
            
            //request.httpBody = try JSONSerialization.data(withJSONObject: dictionary!, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
            request.httpBody = try JSONSerialization.data(withJSONObject: dictionary!, options: .prettyPrinted)
            
            

            
            
        } catch let error {
            print(error.localizedDescription)
            
            Config.showAlerts(title: "Error", message: "Registration Failed", handler: nil, controller: self)
            print(error.localizedDescription)
        }
        
        //request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        //request.addValue("application/json", forHTTPHeaderField: "Accept") //
        
        
        
 
        session.dataTask(with: request) {
            (data, response, error) in
            guard error == nil else {
                print(error!)
                return
            }
            guard let data = data else {
                print("no data")
                return
            }
            
            
            
            do{
                
                let jsonString = String(data: data, encoding: .utf8)
                
                print(jsonString!)
                Config.showAlerts(title: "Returned Value", message: jsonString!, handler: nil, controller: self)
                let responseData = jsonString!.data(using: .utf8)
                if let responeJSON = (try JSONSerialization.jsonObject(with: responseData!, options: []) as? [String: Any]){
                    
                    print(responeJSON)
                }
            } catch  {
                
            }
        }.resume()

    }
    
    func snowLove(){
        let emitter = Animation.createEmitter(with: #imageLiteral(resourceName: "h3"), with: kCAEmitterLayerLine, with: 0.3, with: 0.8, with: 180, with: 25)
        emitter.emitterPosition = CGPoint(x: view.frame.width/2, y: 0)
        emitter.emitterSize = CGSize(width: view.frame.width, height: 2)
        
        view.layer.addSublayer(emitter)
        //emitter.emitterPosition
    }
    
  
    /*   testing purpose
    func jsonStringToObject(String: String) {
        let data = String.data(using: .utf8)!
        do {
            if let jsonArray = try JSONSerialization.jsonObject(with: data, options : .allowFragments) as? [Dictionary<String,Any>]
            {
                print(jsonArray)
            } else {
                print("bad json")
            }
        } catch let error as NSError {
            print(error)
        }
        
        let parameters = ["name": "aaa", "password": "bbb" ]as Dictionary<String, String>

        print(parameters)
    }*/
    /*
    func uploadData(){
        
        let postDictionary = ["status" : false,
                              "message" :"OK"
            ] as [String : Any]
        let jsonEncoder = JSONEncoder()
        guard let url = URL(string: "https://external.dev.pheramor.com") else { return}
        //"https://jsonplaceholder.typicode.com/posts"
        let session = URLSession.shared
        
        var request = URLRequest(url:url)
        request.httpMethod = "POST"
        do {
            let jsonData = try jsonEncoder.encode(ProfileInfo.newUser)
            
            
            let jsonString = String(data: jsonData, encoding: .utf8)
            //print(jsonString!)
            
            
            let jsonDatas = jsonString?.data(using: .utf8)
            let dictionary = try? JSONSerialization.jsonObject(with: jsonDatas!, options: .mutableLeaves)
            
            
            //request.httpBody = try JSONSerialization.data(withJSONObject: dictionary!, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
            request.httpBody = try JSONSerialization.data(withJSONObject: postDictionary, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        //request.addValue("application/json", forHTTPHeaderField: "Accept") //
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            guard error == nil else {
                return
            }
            
            guard let data = data else {
                return
            }
            
            let str = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
            print(str!)
            
            do {
                //create json object from data
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    print(json)
                    print("herer")
                    // handle json...
                }
                
            } catch let error{
                Config.showAlerts(title: "Error", message: "Registration Failed", handler: nil, controller: self)
                print(error.localizedDescription)
                
            }
        })
        task.resume()
        Config.showAlerts(title: "Congrats", message: "Registration Complete", handler: nil, controller: self)
        
    }
    */
}
