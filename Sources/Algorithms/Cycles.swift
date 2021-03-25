//
//  File.swift
//  
//
//  Created by Stan Stadelman on 3/12/21.
//

import Foundation
import PrimitiveStructures

public extension Graph {
    
    func containsUndirectedCycle() -> Bool {
        
        func findParent(of x: Int, in parents: Array<Int>) -> Int {
            guard parents[x] != -1 else { // no parent, boundary
                return x
            }
            return findParent(of: parents[x], in: parents)
        }
        
        func union(x: Int, y: Int, parents: inout Array<Int>) {
            parents[x] = y
        }
        
        let vertexIndexMap = self.vertexIndexMap()
        var parents: Array<Int> = .init(repeating: -1, count: vertexIndexMap.count)
        
        
        for e in self.edges {
            let _x = vertexIndexMap[e.from]!
            let _y = vertexIndexMap[e.to]!
            
            let x = findParent(of: _x, in: parents)
            let y = findParent(of: _y, in: parents)
            
            guard x != y else {
                return true
            }
            union(x: x, y: y, parents: &parents)
        }
        
        return false
    }
    
    func containsDirectedCycle() -> Bool {
        
        var visited: Set<T> = []
        var q = Queue<T>()
        
        for v in vertices {
            q.enqueue(v)
        }
        
        while !q.isEmpty {
            let v = q.dequeue()
            let check = visited.insert(v)
            guard check.inserted else { return true } // was not inserted because already existed
            for e in neighbors(of: v) {
                q.enqueue(e.from)
            }
        }
        
        return false
    }
    
}
