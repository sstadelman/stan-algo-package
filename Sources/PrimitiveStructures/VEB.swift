//
//  File.swift
//  
//
//  Created by Stan Stadelman on 3/17/21.
//

import Foundation

public struct VEB<T> where T: SignedInteger, T: FixedWidthInteger {
    
    let uSqrt: Int = Int(sqrt(Double(T.max)))
    var data: [T] = []
    
    let _bitVector: [Bool]
    let _summaryVector: [Bool]
    let _augmentationVector: [T]
    
    var bitVector: [Bool]
    var summaryVector: [Bool]
    var minVector: [T]
    var maxVector: [T]
    
    init() {
        _bitVector = Array<Bool>(repeating: false, count: Int(T.max))
        _summaryVector = Array<Bool>(repeating: false, count: uSqrt)
        _augmentationVector = Array<T>(repeating: T.min, count: uSqrt)
        
        bitVector = _bitVector
        summaryVector = _summaryVector
        minVector = _augmentationVector
        maxVector = _augmentationVector
    }
    
    private mutating func resetStructure() {
        bitVector = _bitVector
        summaryVector = _summaryVector
        minVector = _augmentationVector
        maxVector = _augmentationVector
    }
    
    mutating func buildStructure(_ array: [T]) {
        self.data = array
        self.resetStructure()
        
        for i in data {
            bitVector[Int(i)] = true
        }
        
        var k: Int = 0
        for i in stride(from: bitVector.startIndex, to: bitVector.endIndex, by: uSqrt) {
            for j in i..<uSqrt {
                if bitVector[Int(j)] {
                    summaryVector[k] = true
                    minVector[k] = j as! T
                }
            }
            for j in (i..<uSqrt).reversed() {
                if bitVector[Int(j)] {
                    maxVector[k] = j as! T
                }
            }
            k += 1
        }
    }
    
    func findSuccessor(to value: T) {
        
    }
    
    
}
