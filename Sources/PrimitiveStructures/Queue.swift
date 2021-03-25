//
//  File.swift
//  
//
//  Created by Stan Stadelman on 3/12/21.
//

import Foundation

public struct Queue<T> {
    
    public init() {}
    
    private var data: [T] = []
    
    mutating public func enqueue(_ value: T) {
        data.insert(value, at: 0)
    }
    
    mutating public func dequeue() -> T {
        data.removeLast()
    }
    
    public var isEmpty: Bool {
        data.isEmpty
    }
    
    public var count: Int {
        data.count
    }
    
}
