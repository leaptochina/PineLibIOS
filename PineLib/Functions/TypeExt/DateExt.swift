//
//  DateExt.swift
//  PineLib
//
//  Created by Pine on 2018/7/25.
//  Copyright © 2018年 Pine. All rights reserved.
//

import UIKit

public extension Date {
    
    
    
    public func toString(format: String = "yyyy-MM-dd HH:mm:ss") -> String! {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        
        
        return formatter.string(from: self);
    }
    
    
    
    
    
    
    
}
