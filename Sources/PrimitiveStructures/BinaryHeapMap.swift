//
//  File.swift
//  
//
//  Created by Stan Stadelman on 3/17/21.
//

import Foundation

open class HeapMap<T>: Heap<T> where T: Comparable, T: Hashable {
    
    var map: [T: Int] = [:]
    
    open override func buildStructure(_ array: [T]) {
        super.buildStructure(array)
        for (index, v) in array.enumerated() {
            map[v] = index
        }
    }
    
    open override func extractNext() -> T {
        let next = super.extractNext()
        map.removeValue(forKey: next)
        return next
    }
    
    open override func insert(_ value: T) {
        guard !map.keys.contains(value) else { preconditionFailure() }
        map.updateValue(count, forKey: value)
        super.insert(value)
    }
    
    open override func raisePriorityOf(valueAt i: Int, to value: T) {
        map.removeValue(forKey: data[i])
        map.updateValue(i, forKey: value)
        super.raisePriorityOf(valueAt: i, to: value)
    }
    
    open override func contains(_ value: T) -> Bool {
        map.keys.contains(value)
    }
    
    open override func contains(where matching: (T) throws -> Bool) -> Bool {
        try! map.keys.contains(where: matching)
    }
    
    open override func location(of item: (T) throws -> Bool) -> Int {
        map.first(where: { try! item($0.key) })?.value ?? -1
    }
    
    open override func swapAt(_ i: Int, _ j: Int) {
        super.swapAt(i, j)
        map.updateValue(i, forKey: data[i])
        map.updateValue(j, forKey: data[j])
    }
}
