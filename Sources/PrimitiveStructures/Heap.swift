//
//  File.swift
//  
//
//  Created by Stan Stadelman on 3/12/21.
//

import Foundation

// Basic array-based heap implementation
open class Heap<T> where T: Comparable {
    
    var data: [T] = []
    let comparator: (T, T) -> Bool
    
    public init(_ comparator: @escaping (T, T) -> Bool) {
        self.comparator = comparator
    }
    
    open func extractNext() -> T {
        guard count > 0 else { preconditionFailure() }
        swapAt(0, data.count - 1)
        let val = data.removeLast()
        
        if count > 0 {
            heapify(at: 0, endIndex: data.count)
        }
        return val
    }
    
    open func insert(_ value: T) {
        var i = count
        data.append(value)
        
        // don't need a full heapify, simply proceed up the tree swapping
        // until the heap condition is met
        while i != 0 && !comparator(data[parent(of: i)], data[i]) {
            swapAt(parent(of: i), i)
            i = parent(of: i)
        }
    }
    
    open func raisePriorityOf(valueAt i: Int, to value: T) {
        var i = i
        self.data[i] = value
        //TODO:
        
        while i != 0 && !comparator(data[parent(of: i)], data[i]) {
            swapAt(parent(of: i), i)
            i = parent(of: i)
        }
    }
    
    open func raisePriorityOf(valueAt i: Int, _ using: (T) -> T) {
        self.raisePriorityOf(valueAt: i, to: using(data[i]))
    }
    
    open func buildStructure(_ array: [T]) {
        self.data = array
        
        guard array.count > 1 else { return }
        let midpoint = parent(of: data.count)
        for i in (0...midpoint).reversed() {
            heapify(at: i, endIndex: data.count)
        }
    }
    
    open func contains(_ value: T) -> Bool {
        data.contains(value)
    }
    
    open func contains(where matching: (T) throws -> Bool) -> Bool {
        try! data.contains(where: matching)
    }
    
    open func item(at index: Int) -> T {
        data[index]
    }
    
    open func location(of item: (T) throws -> Bool) -> Int {
        try! data.firstIndex(where: item)!
    }
    
    open func swapAt(_ i: Int, _ j: Int) {
        data.swapAt(i, j)
    }

}

public extension Heap {
    func heapify(at node: Int, endIndex: Int) {
        var largest = node
        let l = left(node)
        let r = right(node)
        
        if l < endIndex,
           !comparator(data[largest], data[l]) {
            largest = l
        }
        
        if r < endIndex,
           !comparator(data[largest], data[r]) {
            largest = r
        }
        
        guard largest == node else {
            swapAt(largest, node)
            return heapify(at: largest, endIndex: endIndex)
        }
    }
}

public extension Heap {
    var count: Int {
        data.count
    }
    
    var isEmpty: Bool {
        count == 0
    }
    
}

extension Heap: ContiguousTreeIndexing {}

