//
//  Date + Extensions.swift
//  TemplateProject
//
//  Created by Christos Hadjikyriacos on 10/02/2017.
//  Copyright © 2017 Cocoon Creations. All rights reserved.
//

import Foundation


extension Date {
    var toString:String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd \n MMM"
        return formatter.string(from: self)
    }
    
    var toNetworkResponseString:String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyy-MM-dd"
        return formatter.string(from: self)

    }
    
    var seconds:Int {
        let date = Date()
        let calendar = NSCalendar.current
        let components = calendar.dateComponents([.second], from: date)
        return components.second ?? 0
    }
}

public func < (first: Date, second: Date) -> Bool {
    return first.compare(second as Date) == .orderedAscending
}

public func > (first: Date, second: Date) -> Bool {
    return first.compare(second as Date) == .orderedDescending
}

public func <= (first: Date, second: Date) -> Bool {
    let cmp = first.compare(second as Date)
    return cmp == .orderedAscending || cmp == .orderedSame
}

public func >= (first: Date, second: Date) -> Bool {
    let cmp = first.compare(second as Date)
    return cmp == .orderedDescending || cmp == .orderedSame
}

public func == (first: Date, second: Date) -> Bool {
    return first.compare(second as Date) == .orderedSame
}
