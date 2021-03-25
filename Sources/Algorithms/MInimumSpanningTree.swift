//
//  File.swift
//  
//
//  Created by Stan Stadelman on 3/17/21.
//

import Foundation
import PrimitiveStructures

extension Graph {
    
    fileprivate struct Vertex: Comparable {
        var id: T
        var d: U
        
        static func < (lhs: Graph<T, U>.Vertex, rhs: Graph<T, U>.Vertex) -> Bool {
            lhs.d < rhs.d
        }
    }
    
    public func primMST() -> Set<Edge> where U == Int {
        guard adjacencyList.keys.count > 1 else { return Set<Edge>() }
        
        let heap = Heap<Vertex>(<)
        var minimumDistanceEdges: [T: Edge] = [:]
        var result: Set<Edge> = []

        for key in adjacencyList.keys {
            heap.insert(Vertex(id: key, d: Int.max))
        }
        
        heap.raisePriorityOf(valueAt: 0) {
            var cp = $0; cp.d = 0; return cp
        }
        
        while !heap.isEmpty {
            let v = heap.extractNext()
            if let prior = minimumDistanceEdges[v.id] {
                result.insert(prior)
            }
            for e in adjacencyList[v.id, default: []] {
                if heap.contains(where: { $0.id == e.to }) {
                    let heapIndex = heap.location(of: { $0.id == e.to })
                    if e.weight < heap.item(at: heapIndex).d {
                        heap.raisePriorityOf(valueAt: heapIndex) {
                            var cp = $0; cp.d = e.weight; return cp
                        }
                        minimumDistanceEdges[e.to] = e
                    }
                }
            }
        }
        return result
    }
    
    public func kruskalMST() -> Self {

        let heap = Heap<Edge>(<)
        heap.buildStructure(self.edges)
        
        var mst = Self()
        
        while mst.edges.count < self.vertices.count && !heap.isEmpty {
            let e = heap.extractNext()
            let tmp = mst.addingEdge(e)
            if !tmp.containsUndirectedCycle() {
                mst.addEdge(e)
            }
        }
        return mst
    }
}

extension Graph.Edge: Comparable {
    public static func < (lhs: Graph<T, U>.Edge, rhs: Graph<T, U>.Edge) -> Bool {
        lhs.weight < rhs.weight
    }
    
    
}
