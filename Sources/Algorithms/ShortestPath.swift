//
//  File.swift
//  
//
//  Created by Stan Stadelman on 3/12/21.
//

import Foundation
import PrimitiveStructures


extension Graph {

    // requires that graph is directed and weights are non-negative
    public func dijkstra(_ from: T) -> Dictionary<T, U> where U == Int {
        
        guard adjacencyList.keys.count > 1 else { return [:] }
        
        func unwindParents() -> [T: [T]] {
            // TODO: implement path unwind
            return [:]
        }
        
        let priorityQueue = PriorityQueue<T, Int>(<)
        var vDistance: [T: Int] = [:]
//        var vParent: [T: T] = [:]

        for key in adjacencyList.keys {
            priorityQueue.insert(key, Int.max)
        }
        
        priorityQueue.raisePriorityOf(value: from, to: 0)
        
        while !priorityQueue.isEmpty {
            let v = priorityQueue.extractNext()
            
            guard v.priority < Int.max else { break }
            vDistance[v.key] = v.priority
                        
            for e in adjacencyList[v.key, default: []] {
                guard let to = priorityQueue.vertex(for: e.to) else {
                    continue
                }
                
                let testDistance = e.weight + vDistance[v.key, default: 0]
                if testDistance < to.vertex.priority {
                    priorityQueue.raisePriorityOf(valueAt: to.index, to: testDistance)
//                    vParent[e.to] = v.key
                }
            }
        }
        
        return vDistance
    }
    
}
