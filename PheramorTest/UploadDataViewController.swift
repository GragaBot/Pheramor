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
        upload()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func uploadData(){
        
        let jsonEncoder = JSONEncoder()
        do {
            let jsonData = try jsonEncoder.encode(ProfileInfo.newUser)
            
            
            let jsonString = String(data: jsonData, encoding: .utf8)
            //print(jsonString!)
            
            
            let jsonDatas = jsonString?.data(using: .utf8)
            let dictionary = try? JSONSerialization.jsonObject(with: jsonDatas!, options: .mutableLeaves)
            //print(dictionary!)
            
            
            
            guard let url = URL(string: " https://external.dev.pheramor.com") else { return}
            //"https://jsonplaceholder.typicode.com/posts"
            var request = URLRequest(url:url)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            do{
                let jsonBody = try JSONSerialization.data(withJSONObject: dictionary!, options: [])
                request.httpBody = jsonBody
                //print(jsonBody)
            }catch{}
            

            let session = URLSession.shared
            session.dataTask(with: request) {
                (data, response,error) in
                if error != nil {
                    print(error!)
                    return
                }
                let str = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                print(str!)
                guard let data = data else { print("nodata")
                    return}
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch{}
                }.resume()
            
           
        } catch {}
        
        
        

    }
    
    func upload(){
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
            
            request.httpBody = try JSONSerialization.data(withJSONObject: dictionary!, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
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
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    print(json)
                    print("herer")
                    // handle json...
                }
                
            } catch let error {
                print(error.localizedDescription)
            }
        })
        task.resume()

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
    
    
    @IBAction func submitAction(sender: AnyObject) {
        
        //declare parameter as a dictionary which contains string as key and value combination. considering inputs are valid
        
        let parameters = ["name": "ddd", "password": "ddd"] as Dictionary<String, String>
        
        //create the url with URL
        let url = URL(string: "http://myServerName.com/api")! //change the url
        
        //create the session object
        let session = URLSession.shared
        
        //now create the URLRequest object using the url object
        var request = URLRequest(url: url)
        request.httpMethod = "POST" //set http method as POST
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
            
        } catch let error {
            print(error.localizedDescription)
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        //create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            guard error == nil else {
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                //create json object from data
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    print(json)
                    // handle json...
                }
                
            } catch let error {
                print(error.localizedDescription)
            }
        })
        task.resume()
    }
}
