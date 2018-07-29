//
//  Uploader.swift
//  PineLib
//
//  Created by Pine on 2018/7/26.
//  Copyright © 2018年 Pine. All rights reserved.
//

import UIKit
import Alamofire


public class Geter: NetBase {
    
    
    
    var files: [String: String] = [:];
    
    
   

    
    
    public func go(callback: @escaping ([[String : Any]]) -> ()){
        
        Alamofire.request(self.postTo).responseJSON { (response) in
            if let result = response.result.value{
                guard let resDict = result as? [[String: Any]] else{
                    super.error("Diction Error");
                    return;
                }
                
                callback(resDict);
                
                
            }
            else{
                super.error("Result Format Error");
                
            }
        }
        
    }
    
    public func postTo(_ postTo: String) -> Geter{
        self.postTo = postTo;
        
        return self;
    }
}
