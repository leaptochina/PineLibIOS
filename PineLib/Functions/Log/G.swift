//
//  G.swift
//  PineLib
//
//  Created by Pine on 2018/7/25.
//  Copyright © 2018年 Pine. All rights reserved.
//

import UIKit


public class G {
    
    public class func d(_ detail: Any, _ selfObject: Any? = nil,  _ showOnRealse: Bool = false, _ type: String! = " "){
        if (App.i().isDebug || showOnRealse){
            
            if (selfObject != nil){
                var name = selfObject.debugDescription

                name = name.replacingOccurrences(of: "Optional(", with: "");
                name = name.replacingOccurrences(of: ")", with: "");
                name = name.replacingOccurrences(of: "<\(App.i().appName).", with: "");
                name = name.replacingOccurrences(of: ": 0x.........>", with: "", options: .regularExpression);
                
                
                print ("\(type!) \(name): \(detail)");
                return;
                
            }
            
            print ("\(type!) ?:\(detail)");


            
        }
        
    }
    
    public class func i(_ detail: Any, _ selfObject: Any? = nil){
        d (detail, selfObject, true, "I");
    }
    

    
    public class func w(_ detail: Any, _ selfObject: Any? = nil){
        d (detail, selfObject, true, "W");
        
    }
    
    public class func e(_ detail: Any, _ selfObject: Any? = nil){
        d (detail, selfObject, true, "E");
        d (Thread.callStackSymbols, selfObject, true, "E");
    }
}
