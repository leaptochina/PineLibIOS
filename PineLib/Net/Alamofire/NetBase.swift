//
//  NetBase.swift
//  PineLib
//
//  Created by Pine on 2018/7/26.
//  Copyright © 2018年 Pine. All rights reserved.
//

import UIKit

public class NetBase {
    var postTo = "";
    
    public init(){
        
    }
    
    public func error(_ notice: Any = ""){
        G.e("""
            Cann't Access \(self.postTo)
            Reason: \(notice)
            """);
    }

}
