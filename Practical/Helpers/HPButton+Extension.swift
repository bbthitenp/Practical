//
//  HPUIButton+Extension.swift
//  Practical
//
//  Created by PC on 27/11/19.
//  Copyright © 2019 PC. All rights reserved.
//

import Foundation
import UIKit

extension UIButton{
    
    func hpButtonImageColor(image:UIImage,color:UIColor){
        let tintedImage1 = image.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        self.setImage(tintedImage1, for: .normal)
        self.tintColor = color
    }
    
    func setCornerWithColor(size : Int) {
        self.layer.cornerRadius = CGFloat(size)
        self.layer.borderColor = UIColor.clear.cgColor
    }
        
    func setBtnCornerRound() {
        self.layer.layoutIfNeeded()
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.borderColor = UIColor.clear.cgColor
    }
    
    func setCorner(size : Int) {
        
        self.layer.cornerRadius = CGFloat(size)
        self.layer.borderColor = UIColor.clear.cgColor
    }
    
    func roundCornersButton(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
}
