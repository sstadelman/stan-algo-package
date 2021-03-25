
import Foundation
import PrimitiveStructures
import Algorithms
print("foo")

var graph = Graph<Character, Int>()


graph.addEdge(.init("A", "B", weight: 5))
graph.addEdge(.init("B", "A", weight: 5))

graph.addEdge(.init("A", "D", weight: 9))
graph.addEdge(.init("D", "A", weight: 9))

graph.addEdge(.init("B", "C", weight: 2))
graph.addEdge(.init("C", "B", weight: 2))

graph.addEdge(.init("D", "C", weight: 3))
graph.addEdge(.init("C", "D", weight: 3))

graph.addEdge(.init("D", "F", weight: 2))
graph.addEdge(.init("F", "D", weight: 2))

graph.addEdge(.init("E", "F", weight: 3))
graph.addEdge(.init("F", "E", weight: 3))

graph.addEdge(.init("A", "E", weight: 2))
graph.addEdge(.init("E", "A", weight: 2))

let distances = graph.dijkstra("A")

print(distances)
