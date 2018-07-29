//
//  UploadFile.swift
//  PineLib
//
//  Created by Pine on 2018/7/26.
//  Copyright © 2018年 Pine. All rights reserved.
//

import UIKit

public class UploadFile {
    
    public var mimeType: String! = "image/jpeg";
    public var formName: String! = "image";
    public var file: File;
    
    public var data: Data?;
    
    public init(_ formName: String, _ data: Data, _ file: File){
        self.formName = formName;
        self.data = data;
        self.file = file;
        
        if (file.fileName.lowercased().contains("tif")){
            self.mimeType = "tif/tiff";
        }
    }
    
    
}
