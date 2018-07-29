//
//  App.swift
//  PineLib
//
//  Created by Pine on 2018/7/28.
//  Copyright © 2018年 Pine. All rights reserved.
//

import UIKit

public class App {
    
    static var app: App?;
    
    public var isDebug = true;
    public let appName: String;
    
    
    public static func i() -> App!{
        if (App.app == nil){
            App.app = App();
    
        }
        
        return App.app!;
    }
    
    
    init(){
        appName = Bundle.main.infoDictionary!["CFBundleExecutable"]! as! String;
        
        
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: initCheck);

        
    }
    
    
    func initCheck(){
        
        if (isDebug){
            G.i("PineLib Initing...", self)
            
            UnSleep.setCanSleep(false);
            
            let placeholder = UIImage(named: "loading_jpg")
            if (placeholder == nil) {
                G.e("请检查LibAssets是否加入打包项目", self)
            }
            
            
        }
    }
}
