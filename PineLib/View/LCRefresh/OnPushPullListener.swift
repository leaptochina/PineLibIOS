//
//  OnPushPullListener.swift
//  PineLib
//
//  Created by Pine on 2018/7/29.
//  Copyright © 2018年 Pine. All rights reserved.
//

import UIKit

public protocol OnPushPullListener : NSObjectProtocol {

    func onRefresh()
    
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func onLoadMore()
    

}
