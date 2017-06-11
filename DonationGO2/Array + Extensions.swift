//
//  Array + Extensions.swift
//  TemplateProject
//
//  Created by Christos Hadjikyriacos on 10/02/2017.
//  Copyright © 2017 Cocoon Creations. All rights reserved.
//


import Foundation

extension Array where Element : Equatable {
    func allEqual() -> Bool {
        if let firstElem = first {
            return !dropFirst().contains { $0 != firstElem }
        }
        return true
    }
    
    mutating func removeElement(element:Element) {
        
        guard let index = self.enumerated().filter({$0.element == element}).first?.offset else{
            return
        }
        
        self.remove(at: index)
        
    }
    
 
}

extension Array where Element : Hashable {
    var unique: [Element] {
        return Array(Set(self))
    }
}

extension Array {
    func objectAt(index:Int) -> Element? {
        if index >= 0 && index < self.count {
            return self[index]
        }
        
        return nil
    }
    
    
    
}

