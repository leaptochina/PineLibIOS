//
//  MemoryStorage.swift
//  PineLib
//
//  Created by Pine on 2018/7/29.
//  Copyright © 2018年 Pine. All rights reserved.
//

import UIKit

public class MemoryStorage {
    
    private var hash = [String: Any]();
    
    
    
    public func get(key: String){
      
    }
    
    public func set(key: String, value: Any){
        
    }
    
    
    
    
    
    
    static var ms: MemoryStorage? = nil;
    
    public class func i() -> MemoryStorage!{
        if (ms == nil){
            ms = MemoryStorage()
        }
        return ms;
    }
    
    private init(){
        
    }

}
