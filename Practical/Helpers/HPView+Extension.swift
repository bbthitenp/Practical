//
//  HPView+Extension.swift
//  Practical
//
//  Created by PC on 27/11/19.
//  Copyright © 2019 PC. All rights reserved.
//

import UIKit
import Foundation


extension UIView {
    
    var width: CGFloat {
        get { return self.frame.size.width }
        set {
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
    }
    
    var height: CGFloat {
        get { return self.frame.size.height }
        set {
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
    }
    
    var size: CGSize  {
        get { return self.frame.size }
        set {
            var frame = self.frame
            frame.size = newValue
            self.frame = frame
        }
    }
    
    var origin: CGPoint {
        get { return self.frame.origin }
        set {
            var frame = self.frame
            frame.origin = newValue
            self.frame = frame
        }
    }
    
    var x: CGFloat {
        get { return self.frame.origin.x }
        set {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    }
    var y: CGFloat {
        get { return self.frame.origin.y }
        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }
    
    var centerX: CGFloat {
        get { return self.center.x }
        set {
            self.center = CGPoint(x: newValue, y: self.center.y)
        }
    }
    
    var centerY: CGFloat {
        get { return self.center.y }
        set {
            self.center = CGPoint(x: self.center.x, y: newValue)
        }
    }
    
    var top : CGFloat {
        get { return self.frame.origin.y }
        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }
    
    var bottom : CGFloat {
        get { return frame.origin.y + frame.size.height }
        set {
            var frame = self.frame
            frame.origin.y = newValue - self.frame.size.height
            self.frame = frame
        }
    }
    
    var right : CGFloat {
        get { return self.frame.origin.x + self.frame.size.width }
        set {
            var frame = self.frame
            frame.origin.x = newValue - self.frame.size.width
            self.frame = frame
        }
    }
    
    var left : CGFloat {
        get { return self.frame.origin.x }
        set {
            var frame = self.frame
            frame.origin.x  = newValue
            self.frame = frame
        }
    }
    
    func addShadow(offset: CGSize, color: UIColor = .black, opacity: Float = 0.5, radius: CGFloat = 5.0, corners: CGFloat = 0.0) {
        
        self.layer.cornerRadius = corners
        
        let shadowPath2 = UIBezierPath(rect: self.bounds)
        
        self.layer.masksToBounds = false
        
        self.layer.shadowColor = color.cgColor
        
        self.layer.shadowOffset = offset
        
        self.layer.shadowOpacity = opacity
        
        self.layer.shadowPath = shadowPath2.cgPath
        
//        self.layer.masksToBounds = false
//        self.layer.shadowColor = color.cgColor
//        self.layer.shadowOffset = offset
//        self.layer.shadowOpacity = opacity
//        self.layer.shadowRadius = radius
    }
    
    func setRoundView() {
        self.layer.borderWidth = 0.0
        self.layer.masksToBounds = false
        self.layer.cornerRadius = self.frame.size.height/2
        self.clipsToBounds = true
    }
    
    func SetRoundViewCorner(size : Int,borderColor:UIColor) {
        self.layer.cornerRadius = CGFloat(size)
        self.layer.borderWidth = 1
        self.layer.borderColor = borderColor.cgColor
    }
    
    func SetRoundView(backColor:UIColor,borderColor:UIColor) {
        self.backgroundColor = backColor
        self.layer.masksToBounds = false
        self.layer.cornerRadius = self.frame.size.height/2
        self.layer.borderWidth = 1
        self.layer.borderColor = borderColor.cgColor
        self.clipsToBounds = true
    }
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    func GetRightToleftGradientHeader()
    {
        
        self.layoutIfNeeded()
        let colour:UIColor = .red
        let redGradientLayerForHeader = CAGradientLayer()
        redGradientLayerForHeader.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height:  self.frame.size.height)
        redGradientLayerForHeader.colors = [colour.withAlphaComponent(0).cgColor,colour.withAlphaComponent(0.7).cgColor]
        redGradientLayerForHeader.startPoint = CGPoint(x: 0 , y: 0)
        redGradientLayerForHeader.endPoint = CGPoint(x: 1, y: 0)
        redGradientLayerForHeader.locations = [0.0,0.5]
        
        self.layoutIfNeeded()
        self.layer.insertSublayer(redGradientLayerForHeader, at: 0)
    }
    
    func GetleftToRightGradientHeader(colors : [UIColor],cornerRadius:CGFloat)
    {
        self.layoutIfNeeded()
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colors[0].cgColor,colors[1].cgColor]
        gradientLayer.startPoint = CGPoint(x: 0 , y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        gradientLayer.locations = [0.0,1.0]
        gradientLayer.cornerRadius = cornerRadius
        self.layoutIfNeeded()
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
        
    }
    
    func setViewShadowWithcornerRadius() {
        
        self.layoutIfNeeded()
        self.layer.cornerRadius = 7.0
        
        let shadowSize : CGFloat = 5.0
        let shadowPath = UIBezierPath(rect: CGRect(x: -shadowSize / 2,
                                                   y: -shadowSize / 2,
                                                   width: self.frame.size.width + shadowSize,
                                                   height: self.frame.size.height + shadowSize))
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 5.5
        self.layer.shadowColor =  UIColor(red:157.0/255.0, green:158.0/255.0, blue:162.0/255.0, alpha: 0.6).cgColor
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowOpacity = 0.2
        self.layer.shadowPath = shadowPath.cgPath
        self.layoutIfNeeded()
        
    }
    
    func setViewShadowWithcornerRadiusCell(size:CGFloat) {
        
        self.layoutIfNeeded()
        self.layer.cornerRadius = size
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 3.0
        self.layer.shadowColor =  UIColor.black.cgColor
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowOpacity = 0.3
        self.layoutIfNeeded()
        
    }
    
    func addshadow(top: Bool,
                   left: Bool,
                   bottom: Bool,
                   right: Bool,
                   shadowRadius: CGFloat) {
        
        self.layoutIfNeeded()
        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSize(width: 0.0, height: -1.0)
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOpacity = 1.0
        
        let path = UIBezierPath()
        var x: CGFloat = 0
        var y: CGFloat = 0
        var viewWidth = self.frame.width
        var viewHeight = self.frame.height
        
        // here x, y, viewWidth, and viewHeight can be changed in
        // order to play around with the shadow paths.
        if (!top) {
            y+=(shadowRadius+1)
        }
        if (!bottom) {
            viewHeight-=(shadowRadius+1)
        }
        if (!left) {
            x+=(shadowRadius+1)
        }
        if (!right) {
            viewWidth-=(shadowRadius+1)
        }
        // selecting top most point
        path.move(to: CGPoint(x: x, y: y))
        // Move to the Bottom Left Corner, this will cover left edges
        /*
         |☐
         */
        path.addLine(to: CGPoint(x: x, y: viewHeight))
        // Move to the Bottom Right Corner, this will cover bottom edge
        /*
         ☐
         -
         */
        path.addLine(to: CGPoint(x: viewWidth, y: viewHeight))
        // Move to the Top Right Corner, this will cover right edge
        /*
         ☐|
         */
        path.addLine(to: CGPoint(x: viewWidth, y: y))
        // Move back to the initial point, this will cover the top edge
        /*
         _
         ☐
         */
        path.close()
        self.layer.shadowPath = path.cgPath
    }
    
    func setcornerRadius(){
        
        self.layer.layoutIfNeeded()
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.layoutIfNeeded()
    }
    
    
    func setShadowColor(color:UIColor,size:Float){
        
        self.layer.layoutIfNeeded()
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowOpacity = size
        self.layer.shadowRadius = 6.0
        self.layer.layoutIfNeeded()
    }
    
    func setShadow(){
        
        self.layer.layoutIfNeeded()
        self.layer.shadowColor = UIColor(white: 0.0, alpha: 0.5).cgColor
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowOpacity = 0.4
        self.layer.shadowRadius = 6.0
        self.layer.layoutIfNeeded()
    }
    
    func SetRoundViewCorner(size : Int) {
        self.layer.cornerRadius = CGFloat(size)
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.clear.cgColor
        self.clipsToBounds = true
    }
    
    func SetRoundView() {
        self.layer.masksToBounds = false
        self.layer.cornerRadius = self.frame.size.height/2
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.clear.cgColor
        self.clipsToBounds = true
    }
    
    func SetBorder(width:Int,color:UIColor,cornerRadius:Int) {
       
        self.layer.masksToBounds = false
        self.layer.cornerRadius = CGFloat(cornerRadius)
        self.layer.borderWidth = CGFloat(width)
        self.layer.borderColor = color.cgColor
        self.clipsToBounds = true
    }
    
}

class ShapViewRight : UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        context.beginPath()
        context.move(to: CGPoint(x: self.frame.width * 2, y: 0.0))
        context.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
        context.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        context.closePath()
        
        context.setFillColor(UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.85).cgColor)
        context.fillPath()
        
    }
}

class ShapView : UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        
        context.beginPath()
        context.move(to: CGPoint(x: 0, y: self.frame.width/2))
        context.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
        context.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        context.closePath()
        
        context.setFillColor(UIColor(red: 255.0/255.0, green: 49.0/255.0, blue: 87.0/255.0, alpha: 0.81).cgColor)
        context.fillPath()
        
    }
}

class ShapeView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        self.drawLines()
    }
    
    // for Shape Drow
    func drawLines() {
        let context = UIGraphicsGetCurrentContext()
        
        context?.beginPath()
        context?.setFillColor(UIColor(red: 246.0/255.0, green: 122.0/255.0, blue: 46.0/255.0, alpha: 1).cgColor)
        
        if DeviceTypes.IS_IPAD
        {
            context?.move(to: CGPoint(x: 0, y: 70))
            // bottom left corner
            context?.addLine(to: CGPoint(x: 0, y: 0))
            // top middle
            context?.addLine(to: CGPoint(x: frame.width, y: 20))
            // top right corner
            context?.addLine(to: CGPoint(x: frame.width, y: 70))
            
            context?.fillPath()
            context?.closePath()
            
            context?.setLineWidth(50)
            context?.strokePath()
        }else{
            
            context?.move(to: CGPoint(x: self.frame.width * 2, y: 0))
            context?.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
            context?.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
            
//            context?.move(to: CGPoint(x: 0, y: 50))
//            // bottom left corner
//            context?.addLine(to: CGPoint(x: 0, y: 0))
//            // top middle
//            context?.addLine(to: CGPoint(x: frame.width, y: 20))
//            // top right corner
//            context?.addLine(to: CGPoint(x: frame.width, y: 50))
            
            context?.fillPath()
            context?.closePath()
            
            context?.setLineWidth(50)
            context?.strokePath()
            
            context?.beginPath()
            context?.move(to: CGPoint(x: 0, y: self.frame.width/2))
            context?.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
            context?.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
            context?.closePath()
            
            context?.setFillColor(UIColor(red: 255.0/255.0, green: 49.0/255.0, blue: 87.0/255.0, alpha: 0.81).cgColor)
            context?.fillPath()
        }
    }
}
