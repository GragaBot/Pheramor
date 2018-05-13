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
        uploadData()
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
            print(jsonData)
        } catch {}
        /*
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/") else { return}
        //"https://jsonplaceholder.typicode.com/posts"
        var request = URLRequest(url:url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let postDictionary = ProfileInfo.newUser
        do{
            let jsonBody = try JSONSerialization.data(withJSONObject: postDictionary as Any, options: [])
            request.httpBody = jsonBody
            print(jsonBody)
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
            }.resume()*/



    }
}
