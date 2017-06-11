//
//  String + Extensions.swift
//  TemplateProject
//
//  Created by Christos Hadjikyriacos on 10/02/2017.
//  Copyright © 2017 Cocoon Creations. All rights reserved.
//

import UIKit



extension String {
    var isValidEmail:Bool{
        let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    
    var removeSpaces:String {
       return self.trimmingCharacters(in: .whitespaces)
    }
    
    
    var toDecimal:Decimal? {
        let formatter = NumberFormatter()
        formatter.generatesDecimalNumbers = true
        formatter.numberStyle = NumberFormatter.Style.decimal
        if let formattedNumber = formatter.number(from: self) as? NSDecimalNumber  {
            return formattedNumber as Decimal
        }
        
        return nil
    }
    func base64Encoded() -> String? {
        if let data = self.data(using: .utf8) {
            return data.base64EncodedString()
        }
        return nil
    }
    

    func base64Decoded() -> String? {
        if let data = Data(base64Encoded: self) {
            return String(data: data, encoding: .utf8)
        }
        return nil
    }
    
    
    var nullify:String? {
        return isEmpty || self == "" ? nil : self
    }
    
    
    var toUIImage:UIImage? {
        guard let data = Data.init(base64Encoded: self, options: Data.Base64DecodingOptions.ignoreUnknownCharacters) else {return nil}
        return UIImage.init(data: data)
    }
    
    var toDouble:Double? {
        return Double(self)
    }
    
    var toInt:Int? {
        return Int(self)
    }

    
    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }
    
    func substring(from: Int) -> String {
        let fromIndex = index(from: from)
        return substring(from: fromIndex)
    }
    
    func substring(to: Int) -> String {
        let toIndex = index(from: to)
        return substring(to: toIndex)
    }
    
    func substring(with r: Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        return substring(with: startIndex..<endIndex)
    }
    

    

    
 
}
