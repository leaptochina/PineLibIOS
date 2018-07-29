//
//  PhotoLib.swift
//  PineLib
//
//  Created by Pine on 2018/7/25.
//  Copyright © 2018年 Pine. All rights reserved.
//

import UIKit
import Photos

public class PhotoLib: NSObject, PHPhotoLibraryChangeObserver {
    
    
    public var photos: Array<Photo> = Array();
    
    var callback:(Array<Photo>) -> () = nonCallback;
    var photoAssets: PHFetchResult<PHAsset>?;

    
    public func getAllPhotos(_ callback: @escaping (Array<Photo>) -> ()){
        self.callback = callback;
        if (photos.count != 0){
            callback(photos);
        }
        else{
            initPhotoArray();
        }
       
    }
    
    func initPhotoArray(){
        photoAssets = getPhotoAsset();
        
        for i in 0..<photoAssets!.count
        {
            let phAsset = photoAssets!.object(at: i);
            
            let photo = Photo();
            photo.phAsset = phAsset;
            photo.date = phAsset.creationDate;
            photo.width = phAsset.pixelWidth;
            photo.height = phAsset.pixelHeight;
            photo.location = phAsset.location;
            photo.dateString = phAsset.creationDate!.toString();
            photo.fileName = phAsset.value(forKey: "filename") as! String;
            photo.flag = (phAsset as PHObject).localIdentifier;
            
            
            

        
            
            
            photos.append(photo);
            
            
        }
        
        callback(photos);
        
    }
    
    func getPhotoAsset() -> PHFetchResult<PHAsset> {
        //  注意点！！-这里必须注册通知，不然第一次运行程序时获取不到图片，以后运行会正常显示。体验方式：每次运行项目时修改一下 Bundle Identifier，就可以看到效果。
        PHPhotoLibrary.shared().register(self)
        //  获取所有系统图片信息集合体
        let allOptions = PHFetchOptions()
        //  对内部元素排序，按照时间由远到近排序
        allOptions.sortDescriptors = [NSSortDescriptor.init(key: "creationDate", ascending: true)]
        //  将元素集合拆解开，此时 allResults 内部是一个个的PHAsset单元
        let allResults = PHAsset.fetchAssets(with: allOptions)
        
        return allResults;
    }
    
    public func photoLibraryDidChange(_ changeInstance: PHChange) {
        initPhotoArray();
    }
    
    
    
    
    
    
    
    public static var photoLib: PhotoLib? = nil;
    
    public class func i() -> PhotoLib!{
        if (photoLib == nil){
            photoLib = PhotoLib()
        }
        return photoLib;
    }
    
    private override init(){
        
    }
    
    class func nonCallback(cb: Array<Photo>){
        G.d("PhotoLib - 无法找到回调函数");
    }
}
