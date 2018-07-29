//
//  Uploader.swift
//  PineLib
//
//  Created by Pine on 2018/7/26.
//  Copyright © 2018年 Pine. All rights reserved.
//
/***
 
 let photoTmp = photos[0];
 photoTmp.getData { (photo) in
 
 Poster()
 .postTo(Const.upload)
 .addKV("imei", Const.userIdentity)
 .addKV("date", photo.dateString)
 .addKV("urlOnPhone", photo.localUrl)
 .addKV("nameOnPhone", photo.fileName)
 .addKV("uniqueCheck", photo.flag)
 .addFile(uploadFile: UploadFile("image", photo.data!, photo as File))
 .upload { (result) in
 G.d(result);
 }
 
 
 }

 
 */
import UIKit
import Alamofire


public class Poster: NetBase {
    
    let headers = ["content-type": "multipart/form-data"];
    
    var datas: [String: String] = [:];
    var files = Array<UploadFile>();
    
  
    
    public func addKV(_ key: String, _ value: Int) -> Poster{
        return addKV(key, value.toString());
    }
    
    public func addKV(_ key: String, _ value: Double) -> Poster{
        return addKV(key, value.toString());
    }
    
    public func addKV(_ key: String, _ value: Bool) -> Poster{
        return addKV(key, value.toString());
    }
    
    public func addKV(_ key: String, _ value: String) -> Poster{
        datas.updateValue(value, forKey: key)
        
        return self;
    }
    
    
    public func addFile(uploadFile: UploadFile) -> Poster{
        files.append(uploadFile);
        
        return self;
    }
    
    
    public func upload(callback: @escaping ([String : AnyObject]) -> ()){
        
        G.d("Uploading \(files)");
        
        Alamofire.upload(
            multipartFormData: { (multipartFormData) in
                for uploadFile in self.files{
                    multipartFormData.append(uploadFile.data!,  withName: uploadFile.formName, fileName: uploadFile.file.fileName, mimeType: uploadFile.mimeType)
                }
                
                for (key, value) in self.datas{
                    multipartFormData.append(value.toData(), withName: key)
                }
                
                
                
        },
            to: self.postTo,
            headers: self.headers,
            encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseJSON { response in
                        if let value = response.result.value as? [String: AnyObject]{
                            callback(value);
                        }
                        else{
                            super.error("Type Error \(upload) \(response)")
                        }
                    }
                case .failure(let encodingError):
                    super.error(encodingError)
                    
                }
        }
        );
        
    }
    
//    
//    public func go(callback: @escaping ([[String : AnyObject]]) -> ()){
//        
//        Alamofire.request(self.postTo).responseJSON { (response) in
//            if let result = response.result.value{
//                guard let resDict = result as? [[String: AnyObject]] else{
//                    G.e ("Error DIc");
//                    return;
//                }
//                
//                callback(resDict);
//      
//                
//            }
//        }
//        
//    }
//    
    public func postTo(_ postTo: String) -> Poster{
        self.postTo = postTo;
        
        return self;
    }
}
