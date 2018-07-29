//
//  UnSleep.swift
//  PineLib
//
//  Created by Pine on 2018/7/26.
//  Copyright © 2018年 Pine. All rights reserved.
//

import UIKit

public class UnSleep: NSObject {
    
    public class func setCanSleep(_ canSleep: Bool){
        let app = UIApplication.shared;
        app.isIdleTimerDisabled = !canSleep;
    }
}
