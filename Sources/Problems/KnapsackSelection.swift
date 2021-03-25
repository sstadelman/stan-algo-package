//
//  File.swift
//  
//
//  Created by Stan Stadelman on 3/13/21.
//

import Foundation
import PrimitiveStructures

struct KnapsackItem: Hashable {
    let value: Int
    let weight: Int
    var fraction: Double = 1.0
    
    init(_ v: Int, _ w: Int) {
        self.value = v
        self.weight = w
    }
    
    let uuid = UUID()
}

/**
 Constraints:
  - Thief breaks in, carrying empty knapsack with weight limit `maxWeight`
  - select the load with the maximum value  in the `maxWeight`
  - in zeroOne case, whole items must be selected; in fractional case, items may be taken in part
 
 Consider:
  - is there an optimal substructure to each problem?
  - if so, is there a greedy solution, or is dynamic programming required?
 
 Stream of consciousness
  - in both scenarios, the subproblem from maxWeight w(i + 1) is the same structure as w(i): select the load with maximum value for the remaining capacity
  - for the fractional case, since any item can be used to fill the remainder, we can sort the items in descending order by value/weight, and fill from the top
  - for the zeroOne case, we should compute the optimal arrangement of items for each possible weight remainder, and use the memoized values to evaluate each chain of options
  - for zeroOne, we can solve as DAG also
 
 */



// TODO: Should do Rod Cutting first 15.1
func zeroOneKnapsackDP(_ items: [KnapsackItem], maxWeight: Int) -> Int {
    
    // topo sort (all items accessible, so no-op)
    
    var dp: [[Int]] = []
    let row = Array(repeating: 0, count: maxWeight)
    for _ in 0...items.count {
        let cpy = row
        dp.append(cpy)
    }
    
    // problem structure is:
    // dp[i][j] = max(dp[i + 1][j], valueI + dp[i + 1][j - weightI])
    
    var taken: Set<KnapsackItem> = []
    
    for i in (0..<items.count).reversed() { // deal with suffixes
        for j in 0..<maxWeight {
            let dontTake = dp[i + 1][j]
            var take: Int = 0
            if j - items[i].weight >= 0 {
                take = items[i].value + dp[i + 1][j - items[i].weight]
            }
            dp[i][j] = max(dontTake, take)
        }
    }
    return dp[0][maxWeight - 1]
}
//
//    func recurse(_ items: [KnapsackItem], maxWeight: Int, memo: inout [Int: Int]) {
//        guard memo[maxWeight] == nil else { return }
//    }
//
//    //
//    var memo: [Int: Set<KnapsackItem>] = [:]
//    var q = Queue<KnapsackItem>()
//
//    for item in items.sorted(by: { $0.weight < $1.weight }) {
//        q.enqueue(item)
//    }
//
//    while !q.isEmpty {
//        let item = q.dequeue()
//        if memo[item.weight] == nil {
//
//        }
//
//    }
//
//
//    return []


func zeroOneKnapsackGraph(_ items: [KnapsackItem], maxWeight: Int) -> Int {
    return 0
}

extension Set where Element == KnapsackItem {
    func value() -> Int {
        reduce(into: 0) { $0 += $1.value }
    }
}

func fractionalKnapsack(_ items: [KnapsackItem], maxWeight: Int) -> Set<KnapsackItem> {
    var knapsack: Set<KnapsackItem> = []
    let items = items.sorted(by: { $0.value / $0.weight < $1.value / $0.weight })
    var currentItemIndex = 0
    var knapsackWeight = 0
    
    while currentItemIndex < items.count &&
            knapsackWeight + items[currentItemIndex].weight <= maxWeight {
        knapsackWeight += items[currentItemIndex].weight
        knapsack.insert(items[currentItemIndex])
        currentItemIndex += 1
    }
    
    guard currentItemIndex < items.count &&
            knapsackWeight < maxWeight else {
        return knapsack
    }
    
    let avail = maxWeight - knapsackWeight
    let fraction = Double(avail / items[currentItemIndex].weight)
    var item = items[currentItemIndex]
    item.fraction = fraction
    knapsack.insert(item)
    return knapsack
}
