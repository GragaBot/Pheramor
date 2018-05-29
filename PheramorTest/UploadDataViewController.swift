//
//  UploadDataViewController.swift
//  PheramorTest
//
//  Created by T on 5/11/18.
//  Copyright © 2018 T. All rights reserved.
//

import UIKit
import Alamofire


class UploadDataViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //uploadData()
        snowLove()
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
        do {
            let jsonData = try jsonEncoder.encode(ProfileInfo.newUser)
            
            
            let jsonString = String(data: jsonData, encoding: .utf8)
            //print(jsonString!)
            
            
            let jsonDatas = jsonString?.data(using: .utf8)
            let dictionary = try? JSONSerialization.jsonObject(with: jsonDatas!, options: .mutableLeaves)

          
            request.httpBody = try JSONSerialization.data(withJSONObject: dictionary!, options: .prettyPrinted)
      
        } catch let error {
            print("here")
            print(error.localizedDescription)
            
            Config.showAlerts(title: "Error", message: "Registration Failed", handler: nil, controller: self)
            print(error.localizedDescription)
        }
        
        print("POSTED")
        session.dataTask(with: request){
            (data, response, error) in
            guard error == nil else {
                print(error!)
                return
            }
            guard let data = data else {
                print("no data")
                return
            }
            guard let responseString = response else {
                print("no response")
                return
            }
            print(responseString)
            
            guard let response =  String(data: data, encoding: .utf8) else {
                Config.showAlerts(title: "Error", message: "Retrive Feedback Failed", handler: nil, controller: self)
                return
            }
            Config.showAlerts(title: "Default Post Returned Value", message: response, handler: nil, controller: self)

        }.resume()
        
    }
    
    func snowLove(){
        let emitter = Animation.createEmitter(with: #imageLiteral(resourceName: "h3"), with: kCAEmitterLayerLine, with: 0.3, with: 0.8, with: 180, with: 25)
        emitter.emitterPosition = CGPoint(x: view.frame.width/2, y: 0)
        emitter.emitterSize = CGSize(width: view.frame.width, height: 2)
        
        view.layer.addSublayer(emitter)
        //emitter.emitterPosition
    }
    
    @IBAction func uploadViaAlamofire(_ sender: Any) {
        let url = "https://external.dev.pheramor.com"
        
       
        let user = ProfileInfo.newUser
        
        let parameters = user?.dictionaryRepresentation
        print("parameters")
        print(parameters!)

        Alamofire.request(url, method: .post, parameters: parameters ,encoding: JSONEncoding.default, headers: nil).responseJSON {
            response in
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)")
                // original server data as UTF8 string
                
                Config.showAlerts(title: "Alamofire Returned Value", message: utf8Text
                    , handler: nil, controller: self)
            } else {
                Config.showAlerts(title: "Error", message: "Post Failed"
                    , handler: nil, controller: self)
            }
        }
        
        
        
        /*
        Alamofire.request(url).responseJSON { response in
           
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
            }
            if let jsonDict = response.result.value as? [String : Any] {
                print("***")
                print(jsonDict)
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
         
         
            
            // I check the reason for serialization failure. It's because the formate for the JSON is bad. It should be {"status": true, "message": "OK"}
            //If the returned data is {status: true, message: "OK"} the serialization would be able to locate the key thus could not generate JSON
            //I also think firebase is much easier compare to JSON, where you do not have to worry about such issue.
            
        }*/
    }
    
    
    @IBAction func alamofireTest(_ sender: Any) {
        
        let url = "https://jsonplaceholder.typicode.com/posts"
        
        
        let user = ProfileInfo.newUser
        
        let parameters = user?.dictionaryRepresentation
        print("parameters")
        print(parameters!)
        
        Alamofire.request(url, method: .post, parameters: parameters ,encoding: JSONEncoding.default, headers: nil).responseJSON {
            response in
            switch response.result {
            case .success:
                print("SUCCESSS")
               
                
                if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                    print("Data: \(utf8Text)") // original server data as UTF8 string
                    Config.showAlerts(title: "Alamofire Returned Value", message: utf8Text
                        , handler: nil, controller: self)
                }
                
                break
            case .failure(let error):
                
                print(error)
                Config.showAlerts(title: "Error", message: "Registration Failed", handler: nil, controller: self)
            }
        }
    }
    
    @IBAction func defaultUpload(_ sender: Any) {
        upload()
    }
    
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
