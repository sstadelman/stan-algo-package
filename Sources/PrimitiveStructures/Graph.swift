//
//  File.swift
//  
//
//  Created by Stan Stadelman on 3/12/21.
//

import Foundation

public struct Graph<T, U> where T: Hashable, T: Comparable, U: Hashable, U: Comparable {
    
    public struct Edge: Hashable {
        public let from: T
        public let to: T
        public let weight: U
    }
    
    public init() {}
    
    public internal(set) var adjacencyList: [T: Set<Edge>] = [:]
    
    public mutating func addEdge(_ edge: Edge) {
        let insertion = adjacencyList[edge.from, default: []].insert(edge)
        if insertion.inserted {
            _edgesCount += 1
        }
        if !adjacencyList.keys.contains(edge.to) {
            adjacencyList.updateValue([], forKey: edge.to)
        }
    }

    fileprivate var _edgesCount: Int = 0
}

// MARK: - Utility counters & accessors
public extension Graph {
    var vertices: [T] {
        Array(adjacencyList.keys)
    }
    
    var vertexCount: Int {
        adjacencyList.count
    }
    
    var edges: [Edge] {
        adjacencyList.flatMap({ $0.value })
    }
    
    var edgesCount: Int {
        _edgesCount
    }
    
    func vertexIndexMap() -> [T: Int] {
        var s = [T: Int]()
        
        for (index, value) in adjacencyList.keys.enumerated() {
            s[value] = index
        }
        
        return s
    }
    
    func neighbors(of vertex: T) -> Set<Edge> {
        adjacencyList[vertex, default: []]
    }
}

// MARK: - Utility methods for special operations
public extension Graph {
    
    mutating func importAdjacencyMatrix(_ matrix: [[U]], sentinel: U) where T == Int {
        guard let column0 = matrix.first else { return }
        
        for i in 0..<matrix.count {
            for j in 0..<column0.count {
                if matrix[i][j] != sentinel {
                    addEdge(.init(from: i, to: j, weight: matrix[i][j]))
                }
            }
        }
    }
    
    func addingEdge(_ edge: Edge) -> Self{
        var cpy = self
        cpy.addEdge(edge)
        return cpy
    }
}

// MARK: - Convenience Initializers
public extension Graph.Edge {
    init(_ from: T, _ to: T, weight: U = 1.0) where U == Double {
        self.from = from
        self.to = to
        self.weight = weight
    }
    
    init(_ from: T, _ to: T, weight: U = 1) where U == Int {
        self.from = from
        self.to = to
        self.weight = weight
    }
    
    init(_ from: T, _ to: T, weight: U = 1) where U == UInt {
        self.from = from
        self.to = to
        self.weight = weight
    }
}
