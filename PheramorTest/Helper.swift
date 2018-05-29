//
//  Helper.swift
//  PheramorTest
//
//  Created by T on 5/7/18.
//  Copyright © 2018 T. All rights reserved.
//

import Foundation
import UIKit
@IBDesignable



class dropDownBtn: UIButton, dropDownProtocol {
    
    
    
    func dropDownPressed(string: String) {
        self.setTitle(string, for: .normal)
        self.dismissDropDown()
    }
    
    var dropView = dropDownView()
    
    var height = NSLayoutConstraint()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.darkGray
        
        dropView = dropDownView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
        
       
        
        dropView.delegate = self
        dropView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupDropView(){
        self.superview?.addSubview(dropView)
        self.superview?.bringSubview(toFront: dropView)
        
         dropView.topAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
         dropView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
         dropView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        height = dropView.heightAnchor.constraint(equalToConstant: 0)
    }
    /*
    override func didMoveToSuperview() {
        self.superview?.addSubview(dropView)
        self.superview?.bringSubview(toFront: dropView)
       
        dropView.topAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        dropView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        dropView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        height = dropView.heightAnchor.constraint(equalToConstant: 0)
    }*/
    
    var isOpen = false
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isOpen == false {
            
            isOpen = true
            
            NSLayoutConstraint.deactivate([self.height])
            
            if self.dropView.tableView.contentSize.height > 800 {
                self.height.constant = 800
            } else {
                self.height.constant = self.dropView.tableView.contentSize.height
            }
            
            
            NSLayoutConstraint.activate([self.height])
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.dropView.layoutIfNeeded()
                self.dropView.center.y += self.dropView.frame.height / 2
            }, completion: nil)
            
        } else {
            isOpen = false
            
            NSLayoutConstraint.deactivate([self.height])
            self.height.constant = 0
            NSLayoutConstraint.activate([self.height])
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.dropView.center.y -= self.dropView.frame.height / 2
                self.dropView.layoutIfNeeded()
            }, completion: nil)
            
        }
    }
    
    func dismissDropDown() {
        isOpen = false
        NSLayoutConstraint.deactivate([self.height])
        self.height.constant = 0
        NSLayoutConstraint.activate([self.height])
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            self.dropView.center.y -= self.dropView.frame.height / 2
            self.dropView.layoutIfNeeded()
        }, completion: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class dropDownView: UIView, UITableViewDelegate, UITableViewDataSource  {
    
    var dropDownOptions = [String]()
    
    var tableView = UITableView()
    
    var delegate : dropDownProtocol!
    var selectedIndex = -1
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tableView.backgroundColor = UIColor.clear
        self.backgroundColor = UIColor.clear
        
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = UIColor.clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(tableView)
        
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dropDownOptions.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = dropDownOptions[indexPath.row]
        cell.backgroundColor = UIColor.white
        cell.layer.cornerRadius = (cell.frame.size.height)/2
        cell.layer.borderColor = UIColor.yellow.cgColor
        cell.layer.borderWidth = 2
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate.dropDownPressed(string: dropDownOptions[indexPath.row])
        self.tableView.deselectRow(at: indexPath, animated: true)
        self.selectedIndex = indexPath.row
    }
    
}
protocol dropDownProtocol {
    func dropDownPressed(string : String)
}

class DesignableSlider: UISlider {
    @IBInspectable var thumbImage: UIImage? {
        didSet{
            setThumbImage(thumbImage, for: .normal)
        }
    }
    @IBInspectable var thumbHightlightedImage: UIImage? {
        didSet{
            setThumbImage(thumbHightlightedImage, for: .highlighted)
        }
    }
    
    @IBInspectable var maxTrackImage: UIImage? {
        didSet {
            setMaximumTrackImage(maxTrackImage, for: .normal)
        }
    }
    @IBInspectable var minTrackImage: UIImage? {
        didSet {
            setMaximumTrackImage(minTrackImage, for: .normal)
            
        }
    }
}
class RoundedImageView: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        let radius: CGFloat = self.frame.size.height/2
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
}

class RoundedButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.clipsToBounds = true

        let radius: CGFloat = self.frame.size.height/2
        self.layer.cornerRadius = radius
        
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 3
    }
}

class RoundedTextField : UITextField {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.clipsToBounds = true
        
        let radius: CGFloat = self.frame.size.height/2
        self.layer.cornerRadius = radius
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 3
    }
}


class Config: NSObject {
    static func showAlerts(title: String, message: String, handler: ((UIAlertAction) -> Void)?, controller: UIViewController){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title:"OK", style: .cancel, handler: handler)
        alertController.addAction(defaultAction)
        controller.present(alertController, animated: true, completion: nil)
    }
    
}

class Animation {
    static func createEmitter(with image: UIImage, with emittershape: String, with scale: Float, with birthRate: Float, with emission: Float, with velocity: Float) -> CAEmitterLayer{
        let emitter = CAEmitterLayer()
        emitter.emitterShape = emittershape
        emitter.emitterCells = generateEmitterCells(with: image, with: scale, with: birthRate, with: emission, with: velocity)
        
        return emitter
    }
    static func generateEmitterCells(with image: UIImage, with scale: Float, with birthRate: Float, with emission: Float, with velocity: Float) -> [CAEmitterCell]{
        var cells = [CAEmitterCell]()
        let cell = CAEmitterCell()
        
   
        cell.contents = image.cgImage
     
        cell.birthRate = birthRate
        cell.lifetime = 50
        cell.velocity = CGFloat(velocity)
        cell.emissionLongitude = (CGFloat(emission * (.pi/180)))
        cell.emissionRange = (45 * (.pi / 180))
        cell.scale = CGFloat(scale)
        cell.scaleRange = 0.2
        cell.alphaRange = 1
        cells.append(cell)
    
        return cells
    }
}


