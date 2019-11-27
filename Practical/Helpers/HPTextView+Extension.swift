//
//  HPTextView+Extension.swift
//  Practical
//
//  Created by PC on 27/11/19.
//  Copyright © 2019 PC. All rights reserved.
//

import Foundation
import UIKit

extension UITextView {
    func addImageWithText(name: String, str: String) {
        
        let imageAttachment =  NSTextAttachment()
        imageAttachment.image = UIImage(named: name)
        let imageOffsetY:CGFloat = -5;
        imageAttachment.bounds = CGRect(x: 0, y: imageOffsetY, width: 20, height: 20)
        let attachmentString = NSAttributedString(attachment: imageAttachment)
        let completeText = NSMutableAttributedString(string: "")
        completeText.append(attachmentString)
    
        let range = (str as NSString).range(of: str)
        let attribute = NSMutableAttributedString.init(string: str)
        attribute.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 14), range: range)
        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.white , range: range)
        completeText.append(attribute)
        
        self.textAlignment = .left;
        self.attributedText = completeText;
        
    }
}

