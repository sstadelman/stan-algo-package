//
//  File.swift
//  
//
//  Created by Stan Stadelman on 3/13/21.
//

import Foundation

extension ArraySlice where Element == Int {
    
    func indexOfPivot() -> Int {
        
        let midpoint: Int = startIndex + (endIndex - startIndex) / 2
        
        switch count {
            case 2:
                return self[startIndex] > self[startIndex + 1] ? startIndex + 1 : startIndex
            case 1:
                return startIndex
            default:
                if self[endIndex - 1] < self[midpoint] {
                    return self[midpoint...].indexOfPivot()
                } else if self[startIndex] > self[midpoint] {
                    return self[startIndex...midpoint].indexOfPivot()
                } else {
                    return startIndex
                }
        }
        
    }
    

}
