import XCTest
@testable import PrimitiveStructures
@testable import Algorithms

final class MinimumSpanningTreeTests: XCTestCase {
    
        
    override func setUp() {
        super.setUp()
    }
    
    func testPrim() {
        
        var graph = Graph<Character, Int>()
        
        graph.addEdge(.init("A", "D", weight: 1))
        graph.addEdge(.init("D", "A", weight: 1))
        
        graph.addEdge(.init("A", "B", weight: 3))
        graph.addEdge(.init("B", "A", weight: 3))
        
        graph.addEdge(.init("B", "D", weight: 3))
        graph.addEdge(.init("D", "B", weight: 3))
        
        graph.addEdge(.init("B", "C", weight: 1))
        graph.addEdge(.init("C", "B", weight: 1))
        
        graph.addEdge(.init("D", "C", weight: 1))
        graph.addEdge(.init("C", "D", weight: 1))
        
        graph.addEdge(.init("D", "E", weight: 6))
        graph.addEdge(.init("E", "D", weight: 6))
        
        graph.addEdge(.init("C", "E", weight: 5))
        graph.addEdge(.init("E", "C", weight: 5))
        
        graph.addEdge(.init("E", "F", weight: 2))
        graph.addEdge(.init("F", "E", weight: 2))
        
        graph.addEdge(.init("C", "F", weight: 4))
        graph.addEdge(.init("F", "C", weight: 4))
        
        let edges = graph.primMST()
        
        XCTAssert(edges.count == 5)
        let weight = edges.map { $0.weight }.reduce(0, +)
        XCTAssert(weight == 9)
        
    }
    
    func testKruskal() {
        var g = Graph<Int, Int>()
        g.addEdge(.init(from: 7, to: 6, weight: 1))
        g.addEdge(.init(from: 8, to: 2, weight: 2))
        g.addEdge(.init(from: 6, to: 5, weight: 2))
        g.addEdge(.init(from: 0, to: 1, weight: 4))
        g.addEdge(.init(from: 2, to: 5, weight: 4))
        g.addEdge(.init(from: 8, to: 6, weight: 6))
        g.addEdge(.init(from: 2, to: 3, weight: 7))
        g.addEdge(.init(from: 7, to: 8, weight: 7))
        g.addEdge(.init(from: 0, to: 7, weight: 8))
        g.addEdge(.init(from: 1, to: 2, weight: 8))
        g.addEdge(.init(from: 3, to: 4, weight: 9))
        g.addEdge(.init(from: 5, to: 4, weight: 10))
        g.addEdge(.init(from: 1, to: 7, weight: 11))
        g.addEdge(.init(from: 3, to: 5, weight: 14))

        let mst = g.kruskalMST()
        var output: [String] = []
        print(mst.edges.map({ String(describing: $0) }).joined(separator: "\n "))
        XCTAssert(mst.edges.map({ $0.weight }).reduce(0, +) == 37)
//        print(mst.edges.map({ "\($0.0.0) -(\($0.1))- \($0.0.1)" }).joined(separator: "\n"))
        
//        XCTAssert(mst.weight == 37, "mst.weight: \(mst.weight) != 37")    }
    }
}
