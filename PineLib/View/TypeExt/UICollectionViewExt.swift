//
//  UICollectionViewExt.swift
//  PineLib
//
//  Created by Pine on 2018/7/29.
//  Copyright © 2018年 Pine. All rights reserved.
//

import UIKit
import LCRefresh



public extension UICollectionView {
    
//    var listener: OnPushPullListener?{
//
//
//        set (newValue){
//            let key: UnsafeRawPointer! = UnsafeRawPointer.init(bitPattern: "listener".hashValue)
//            objc_setAssociatedObject(self, key, newValue, .OBJC_ASSOCIATION_ASSIGN)
//        }
//
//        get {
//            let key: UnsafeRawPointer! = UnsafeRawPointer.init(bitPattern: "listener".hashValue)
//            let obj: OnPushPullListener? = objc_getAssociatedObject(self, key) as? OnPushPullListener
//            return obj!
//        }
//
//
//    }
    
    public func setOnPushPullListener(listener: OnPushPullListener!){
        //self.listener = listener;
        
        
        
        self.refreshHeader = LCRefreshHeader.init(refreshBlock: {
            listener.onRefresh();
        })
        
        self.refreshFooter = LCRefreshFooter.init(refreshBlock: {
            listener.onLoadMore();
        })
    }
    
    public func onRefreshed(){
        
        if self.isHeaderRefreshing() {
            self.endHeaderRefreshing()
        }

        
        self.reloadData()
        self.resetDataLoad()
    }
    
    
    public func onLoaded(){
        
        if self.isFooterRefreshing() {
            self.endFooterRefreshing()
        }
        
        self.reloadData()
        self.setDataLoadover()
    }
    
    public func notifyDataSetChanged(){
        self.reloadData()
    }
    
}
