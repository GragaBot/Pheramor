//
//  ProfileImageViewController.swift
//  PheramorTest
//
//  Created by T on 5/12/18.
//  Copyright © 2018 T. All rights reserved.
//

import UIKit

class ProfileImageViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var profileImage: RoundedImageView!
    
    @IBOutlet weak var selectProfileImageBtn: RoundedButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImage.loadGif(name: "avatar")
        if ProfileInfo.newProfile.profileImage != "" {
            profileImage.image = UIImage.imageWithBase64String(base64String: ProfileInfo.newProfile.profileImage)
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func changeImage(_ sender: Any) {
        
        presentImagePickerView()
    }
    func presentImagePickerView() {
        profileImage.loadGif(name: "calm-down")
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func setImage(withImage image: UIImage) {
        
        self.profileImage.image = image
        uploadImage(withImage: image)

        
    }
    
    func uploadImage(withImage image: UIImage) {
        
       let imageData =  image.base64String()
        
        ProfileInfo.newProfile.profileImage = imageData as String
        
        
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var selectedImage: UIImage?
        
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            selectedImage = editedImage
        }
        else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            selectedImage = originalImage
        }
        if let finalImage = selectedImage {
            self.setImage(withImage: finalImage)
            picker.dismiss(animated: true, completion: nil)
        }
        
    }
    
    @IBAction func dimiss(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)

    }
    
    @IBAction func nextStep(_ sender: Any) {
        
        
        
        if ProfileInfo.newProfile.profileImage != "" {
            //saveImage(image: profileImage.image!)
            uploadImage(withImage: profileImage.image!)
        } else {
            Config.showAlerts(title: "Error", message: "Select Profile Image", handler: nil, controller: self)
        }
        
    }
    
    func saveImage(image: UIImage) -> Bool {
        guard let data = UIImageJPEGRepresentation(image, 1) ?? UIImagePNGRepresentation(image) else {
            return false
        }
        guard let directory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) as NSURL else {
            return false
        }
        do {
            try data.write(to: directory.appendingPathComponent("fileName.png")!)
            return true
        } catch {
            print(error.localizedDescription)
            return false
        }
    }

}

extension UIImage {
    func base64String() -> String {
        let imageData : NSData = UIImageJPEGRepresentation(self, 0.1)! as NSData
       
        
        let base64String = imageData.base64EncodedString(options: .lineLength64Characters)
        return base64String
    }
    
    static func imageWithBase64String(base64String: String) -> UIImage {
        let decodedData = Data(base64Encoded: base64String, options: .ignoreUnknownCharacters)!
        let postImage = UIImage(data: decodedData)!
        return postImage
    }
}

