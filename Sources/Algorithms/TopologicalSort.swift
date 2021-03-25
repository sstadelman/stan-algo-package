//
//  File.swift
//  
//
//  Created by Stan Stadelman on 3/15/21.
//

import Foundation
import PrimitiveStructures

extension Graph {
    
    func topoSortedVertices() -> Queue<T> {
        var order = Queue<T>()
        var processNext = Queue<T>()
        
        var inbound: [T: Int] = [:]
        for v in vertices {
            inbound[v] = 0
        }
        
        try? breadthFirstTraverse({ v in
            let edges = self.adjacencyList[v, default: []]
            for e in edges {
                inbound[e.to, default: 0] += 1
            }
        })
        
        let noInbound = inbound.filter({ $0.value == 0 }).map({ $0.key })
        for n in noInbound {            processNext.enqueue(n)
        }
        
        while !processNext.isEmpty {
            let next = processNext.dequeue()
            for e in adjacencyList[next, default: []] {
                inbound[e.to]! -= 1
                if inbound[e.to]! == 0 {
                    processNext.enqueue(e.to)
                    order.enqueue(e.from)
                }
            }
        }
        guard order.count == vertices.count else {
            preconditionFailure()
        }
        return order
    }
}
