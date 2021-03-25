//
//  File.swift
//  
//
//  Created by Stan Stadelman on 3/24/21.
//

import Foundation

open class PriorityQueue<T, U>: Heap<PriorityQueue.Vertex> where T: Comparable, T: Hashable, U: Comparable, U: Hashable {
    
    public struct Vertex: Comparable, Hashable {
        public let key: T
        public var priority: U
        
        public static func < (lhs: Vertex, rhs: Vertex) -> Bool {
            lhs.priority < rhs.priority
        }
    }
    
    public enum Error: Swift.Error {
        case missingValue
    }
    
    open func insert(_ value: T, _ priority: U) {
        super.insert(Vertex(key: value, priority: priority))
    }
    
    open func raisePriorityOf(value: T, to priority: U) {
        guard let index = super.data.firstIndex(where: { $0.key == value }) else {
            preconditionFailure()
        }
        super.raisePriorityOf(valueAt: index, to: .init(key: value, priority: priority))
    }
    
    open func raisePriorityOf(valueAt index: Int, to priority: U) {
        super.raisePriorityOf(valueAt: index, to: .init(key: data[index].key, priority: priority))
    }
    
    open func vertex(for value: T) -> (vertex: Vertex, index: Int)? {
        guard let idx = data.firstIndex(where: { $0.key  == value }) else {
            return nil
        }
        return (data[idx], idx)
    }
}
