//
//  IntExt.swift
//  PineLib
//
//  Created by Pine on 2018/7/25.
//  Copyright © 2018年 Pine. All rights reserved.
//


import UIKit

public extension Int {
    public func toString() -> String! {
        return String(self)
    }
    
    public func toDouble() -> Double! {
        return Double(self)
    }
    
    public func toBool() -> Bool {
        return (self != 0)
    }
    
    
    
}

