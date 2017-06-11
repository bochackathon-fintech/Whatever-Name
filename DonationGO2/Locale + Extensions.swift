//
//  Locale + Extensions.swift
//  MFSNetinfo
//
//  Created by Panayiotis on 15/03/2017.
//  Copyright © 2017 netinfo. All rights reserved.
//

import Foundation


extension Locale {
    
    static var language:String {
        return Locale.preferredLanguages.first?.components(separatedBy: "-").first ?? "en"
    }
}
