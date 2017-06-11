//
//  UIImage + Extensions.swift
//  TemplateProject
//
//  Created by Christos Hadjikyriacos on 10/02/2017.
//  Copyright © 2017 Cocoon Creations. All rights reserved.
//

import UIKit


extension UIImage {
    class func image(fromColor color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
    
    func imageWithColor(color: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        
        let context = UIGraphicsGetCurrentContext()! as CGContext
        context.translateBy(x: 0, y: self.size.height)
        context.scaleBy(x: 1.0, y: -1.0);
        context.setBlendMode(CGBlendMode.normal)
        
        let rect = CGRect(x:0,y:0,width:self.size.width,height:self.size.height) as CGRect
        context.clip(to: rect, mask: self.cgImage!)
        color.setFill()
        context.fill(rect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()! as UIImage
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    
    func convertForUpload(decreaseSizeBy:Int = 4,quality:CGFloat = 0.5) -> String? {
        let imageSize = self.size.descreaseBy(times: decreaseSizeBy)
        let newImage = self.scaledToSize(size: imageSize)
        let data = UIImageJPEGRepresentation(newImage, quality)
        guard let image_data =  data?.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters) else { return nil }
        return "data:image/jpeg;base64," + image_data
    }
    
    func scaledToSize(size: CGSize) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0);
        self.draw(in: CGRect(x:0,y:0,width:size.width,height:size.height))
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
    
    func saveToDocuments(name:String?) {
        
        let queue = OperationQueue()
        
        queue.addOperation() {
            if let _name = name {
                let nsDocumentDirectory = FileManager.SearchPathDirectory.documentDirectory
                let nsUserDomainMask = FileManager.SearchPathDomainMask.userDomainMask
                let paths = NSSearchPathForDirectoriesInDomains(nsDocumentDirectory, nsUserDomainMask, true)
                if paths.count > 0 {
                    if let dirPath = paths.first,
                        let url = NSURL(string: dirPath){
                        let writePath = url.appendingPathComponent(_name)
                        try? UIImagePNGRepresentation(self)?.write(to: writePath!)
                        
                    }
                }
                
            }
        }
    }
    
    class func loadFromDocuments(name:String) -> UIImage? {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        if let url = NSURL(string: paths) {
            let getImagePath = url.appendingPathComponent(name)
            let checkValidation = FileManager.default
            if (checkValidation.fileExists(atPath: getImagePath!.absoluteString))
            {
                return UIImage(contentsOfFile: getImagePath!.absoluteString)
            }
            
        }
        
        return nil
        
        
    }
    

}
