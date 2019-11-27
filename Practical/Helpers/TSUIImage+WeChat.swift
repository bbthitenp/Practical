//
//  TSUIImage+WeChat.swift
//  Practical
//
//  Created by PC on 27/11/19.
//  Copyright © 2019 PC. All rights reserved.
//

/*
https://github.com/AliSoftware/SwiftGen 在电脑上安装这个工具，自动生成 Asset 的 image enum 的 Extension

CLI 切换到：./TSWeChat/Resources
命令：swiftgen images Media.xcassets
*/


typealias TSAsset = UIImage.Asset

import Foundation
import UIKit

extension UIImage {
    enum Asset : String {
        case ic_logout = "ic_logout"
        case ic_menu = "ic_menu"
     
        var image: UIImage {
            return UIImage(asset: self)
        }
    }
    
    convenience init!(asset: Asset) {
        self.init(named: asset.rawValue)
    }
}





