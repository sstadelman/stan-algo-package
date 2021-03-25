//
//  File.swift
//  
//
//  Created by Stan Stadelman on 3/15/21.
//

import Foundation
import PrimitiveStructures

extension Graph {
    public func breadthFirstTraverse(_ action: (T) throws -> Void, preSort: ((T, T) -> Bool)? = nil) throws {
        let vertices: [T]
        if let preSort = preSort {
            vertices = self.vertices.sorted(by: preSort)
        } else {
            vertices = self.vertices
        }
        
        var visited: Set<T> = []
        var queue = Queue<T>()
        
        for v in vertices {
            queue.enqueue(v)
        }
        
        while !queue.isEmpty {
            let v = queue.dequeue()
            let inserted = visited.insert(v)
            guard inserted.inserted else {
                continue
            }
            try action(v)
        }
    }
}
