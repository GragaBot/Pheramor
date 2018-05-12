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
        
    }
    /*
    func uploadImage(withImage image: UIImage) {
        let imageData = UIImageJPEGRepresentation(image, 0.7)!
        
        API.userAPI.uploadCurrentUserProfileImage(imageData: imageData, onSuccess: {
            print("Upload Success")
        })
        
    }*/
    
    
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

    

}
