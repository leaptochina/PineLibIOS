//
//  CheckGo.swift
//  photoBackup
//
//  Created by Pine on 2018/7/23.
//  Copyright © 2018年 Pine. All rights reserved.
//

import UIKit
import Alamofire
import Photos
import PineLib

class CheckGo: NSObject {

    
    
    let status: UILabel?;
    var totalPhotoQuanlity = 0;
    var uploadedQuanlity = 0;
    var photos: Array<Photo>?;
    
    init(status: UILabel?) {
        self.status = status;
        self.totalPhotoQuanlity = 0;
        self.uploadedQuanlity = 0;
    }
   
    func startCheck(photos: Array<Photo>) {
        self.photos = photos;
        
        
        for photoTmp in photos{
            if (photoTmp.id == 0){
                totalPhotoQuanlity += 1;
            }
        }
        
        
        checkLooper();
      
    }
    
    func checkLooper(){
        updateUI();
        
        for photoTmp in photos!{
            
            if (photoTmp.id == 0){
                
                photoTmp.id = -1
                
                photoTmp.getData { (photo) in

                    var poster = Poster()
                                .postTo(Const.upload)
                                .addKV("imei", Const.userIdentity)
                                .addKV("date", photo.dateString)
                                .addKV("urlOnPhone", photo.localUrl != nil ? photo.localUrl : "")
                                .addKV("nameOnPhone", photo.fileName)
                                .addKV("uniqueCheck", photo.flag);
                    if (photo.data != nil){
                        poster = poster.addFile(uploadFile: UploadFile("image", photo.data!, photo as File))
                    }
                    
                    poster.upload { (result) in
                            G.d(result, self);
                            self.uploadedQuanlity += 1;
                            self.checkLooper();
                    }
                        
                    

                    
                    
                }
                break;
            }
            
        }
    }
    
  
    
    func updateUI() {

        status?.text = "\(self.uploadedQuanlity) / \(self.totalPhotoQuanlity)";
    }
    
  

    
}
