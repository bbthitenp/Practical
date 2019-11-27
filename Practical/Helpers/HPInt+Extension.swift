//
//  HPInt+Extension.swift
//  Practical
//
//  Created by PC on 27/11/19.
//  Copyright © 2019 PC. All rights reserved.
//

import Foundation

extension Int {
    
    public func intToTime() -> String {
        if(self > 59){
            
            let formatter = DateComponentsFormatter()
            formatter.allowedUnits = [.hour, .minute, .second]
            formatter.unitsStyle = .positional
            let formattedString = formatter.string(from: TimeInterval(self))!
            
            return formattedString
        }else{
            let str = "\(0):\(Int(self))"
            return str
        }
    }
}
