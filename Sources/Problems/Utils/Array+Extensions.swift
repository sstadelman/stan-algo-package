//
//  File.swift
//  
//
//  Created by Stan Stadelman on 3/13/21.
//

import Foundation

extension Array where Element == Int {
    func maxIndex() -> Int {
        var _i: Int!
        var _max: Int = Int.min
        
        for i in 0..<count {
            if self[i] > _max {
                _i = i
                _max = self[i]
            }
        }
        
        return _i
    }
}
