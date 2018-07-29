//
//  ViewController.swift
//  photoBackup
//
//  Created by Pine on 2018/7/23.
//  Copyright © 2018年 Pine. All rights reserved.
//

import UIKit
import PineLib
import LCRefresh

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, OnPushPullListener{


    
  
    @IBOutlet weak var status: UILabel!
    var checker: CheckGo!;
    @IBOutlet weak var uiCollectionView: UICollectionView!
    
    
    
    @IBAction func Test(_ sender: Any) {
        
    }
    
    @IBAction func onClick(_ sender: Any) {
        PhotoLib.i().getAllPhotos(callback);
        
    }
    
    func onRefresh() {
        G.d(1);
        Thread.sleep(forTimeInterval: 1);
        uiCollectionView.onRefreshed();
    }
    
    func onLoadMore() {
        G.d(2);
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = checker?.photos?.count {
             return count;
        }
        return 0;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCell
        
        
        cell.image.downloadedFrom("http://api1.intbr.com/photo/photo/picture?isThumb=1&id=" + checker!.photos![indexPath.row].id.toString())
        
        return cell;
        
    }
    
    func callback(photos: Array<Photo>){
        
        
        
        Geter().postTo(Const.list).go { (v) in

            var values = v;
            
            
            for photo in photos{
                //G.d(value)
                for i in 0..<values.count{
                    let value = values[i]
                    if (photo.id == 0){
                        if (photo.flag == value["unique_check"] as? String){
                            photo.id = value["id"] as! Int;
                            G.d(photo.id, self)
                            values.remove(at: i);
                            
                            break;
                        }
                    }
                }
     
            }
            
            
            
            self.checker = CheckGo(status: self.status);
            self.checker.startCheck(photos: photos);
            
            self.uiCollectionView.notifyDataSetChanged();
            
            //G.d(photos);
        }
        
   
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        uiCollectionView.setOnPushPullListener(listener: self);
        
        PhotoLib.i().getAllPhotos(callback);

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

