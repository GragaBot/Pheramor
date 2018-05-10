//
//  Helper.swift
//  PheramorTest
//
//  Created by T on 5/7/18.
//  Copyright © 2018 T. All rights reserved.
//

import Foundation
import UIKit

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
    static func createEmitter(with image: UIImage, with emittershape: String, with scale: Float, with birthRate: Float, with emission: Float) -> CAEmitterLayer{
        let emitter = CAEmitterLayer()
        emitter.emitterShape = emittershape
        emitter.emitterCells = generateEmitterCells(with: image, with: scale, with: birthRate, with: emission)
        
        return emitter
    }
    static func generateEmitterCells(with image: UIImage, with scale: Float, with birthRate: Float, with emission: Float) -> [CAEmitterCell]{
        var cells = [CAEmitterCell]()
        let cell = CAEmitterCell()
        
   
        cell.contents = image.cgImage
        cell.birthRate = birthRate
        cell.lifetime = 50
        cell.velocity = CGFloat(25)
        cell.emissionLongitude = (CGFloat(emission * (.pi/180)))
        cell.emissionRange = (45 * (.pi / 180))
        cell.scale = CGFloat(scale)
        cell.scaleRange = 0.2
        cell.alphaRange = 1
        cells.append(cell)
    
        return cells
    }
}

