//
//  HPUIImageView+Extension.swift
//  Practical
//
//  Created by PC on 27/11/19.
//  Copyright © 2019 PC. All rights reserved.
//

import UIKit
import SDWebImage

extension UIImageView {
    
    func SetRedusImageWithBorderColor() {
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 3
        self.clipsToBounds = true
    }
    
    func setRoundImage() {
        self.layer.borderWidth = 0.0
        self.layer.masksToBounds = false
        self.layer.cornerRadius = self.frame.size.height/2
        self.clipsToBounds = true
    }
    
    func SetImgcornerRadius(backColor:UIColor,borderColor:UIColor,radius:CGFloat) {
        self.backgroundColor = backColor
        self.layer.masksToBounds = false
        self.layer.cornerRadius = radius
        self.layer.borderWidth = 1
        self.layer.borderColor = borderColor.cgColor
        self.clipsToBounds = true
    }
    
    func setImageColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }
    
    func loadImage(url:String,contentMode:ContentMode,placeholderImage:UIImage? = nil) {
//        self.sd_setShowActivityIndicatorView(true)
//        self.sd_setIndicatorStyle(.gray)
        self.contentMode = contentMode
        self.clipsToBounds = true
        if placeholderImage == nil {
            self.sd_setImage(with: URL(string: url))
        }else{
            self.sd_setImage(with: URL(string: url), placeholderImage: placeholderImage)
        }
    }
}

extension UIImage {
    func resized(withPercentage percentage: CGFloat) -> UIImage? {
        let canvasSize = CGSize(width: size.width * percentage, height: size.height * percentage)
        UIGraphicsBeginImageContextWithOptions(canvasSize, false, scale)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: canvasSize))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    func resized(toWidth width: CGFloat) -> UIImage? {
        let canvasSize = CGSize(width: width, height: CGFloat(ceil(width/size.width * size.height)))
        UIGraphicsBeginImageContextWithOptions(canvasSize, false, scale)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: canvasSize))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
