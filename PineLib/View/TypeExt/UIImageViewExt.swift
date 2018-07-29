//
//  UIImageViewExt.swift
//  PineLib
//
//  Created by Pine on 2018/7/28.
//  Copyright © 2018年 Pine. All rights reserved.
//

import UIKit
import Kingfisher


public extension UIImageView {
    public func downloadedFrom(_ from: String, contentMode mode: UIViewContentMode = .scaleToFill) {
        if let url = URL(string: from) {
            self.downloadedFrom(url: url)
        }
        else{
            G.w("URL Format Error", self)
        }
    }
    
    public func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleToFill) {
        let placeholder = UIImage(named: "loading_jpg")
        self.kf.setImage(with: url, placeholder: placeholder);
    }
    
    public func downloadedFrom1(url: URL, contentMode mode: UIViewContentMode = .scaleToFill) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            // The download has finished.
            if let e = error {
                G.w("Error downloading cat picture: \(e)", self)
            } else {
                // No errors found.
                // It would be weird if we didn't have a response, so check for that too.
                if let res = response as? HTTPURLResponse {
                    print("Downloaded cat picture with response code \(res.statusCode)")
                    if let imageData = data {
                        // Finally convert that Data into an image and do what you wish with it.
                        let image = UIImage(data: imageData)
                        // Do something with your image.
                        DispatchQueue.main.async() { () -> Void in
                            self.image = image
                        }
                        
                    } else {
                        G.w("Couldn't get image: Image is nil", self)
                    }
                } else {
                    G.w("Couldn't get response code for some reason", self)
                }
            }
            
            }.resume()
        
    }
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}
