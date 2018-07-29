//
//  Photo.swift
//  PineLib
//
//  Created by Pine on 2018/7/25.
//  Copyright © 2018年 Pine. All rights reserved.
//

import UIKit
import Photos

public class Photo: File{
    
    public var id: Int = 0;

    public var width: Int = 0;
    public var height: Int = 0;
    

    
    public var phAsset: PHAsset?;
    public var location: CLLocation?;
    public var uiImage: UIImage?;
    public var data: Data?;
    
    

    
    public func getData(callback: @escaping (Photo) -> ()){

        G.d("Geting data: " + fileName)
        
        PHImageManager.default().requestImageData(for: self.phAsset!, options: nil) { (imageData:Data?, dataUTI:String?, orientation:UIImageOrientation, info:[AnyHashable : Any]?) in
            if (imageData != nil){
                self.data = imageData;
                self.uiImage = UIImage(data: imageData!)!;
                self.size = imageData!.count;
                self.md5 = imageData!.hashValue.toString();
                
                let lu = info!["PHImageFileURLKey"] as? URL;
                self.localUrl = lu?.absoluteString;
            }
            
                
            callback(self)
        }
        
    }
    
    public override init(){
        
    }
    


    
}
