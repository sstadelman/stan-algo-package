//
//  File.swift
//  
//
//  Created by Stan Stadelman on 3/16/21.
//

import Foundation

/**
 There is a one-dimensional garden on the x-axis. The garden starts at the point 0 and ends at the point n. (i.e The length of the garden is n).

 There are n + 1 taps located at points [0, 1, ..., n] in the garden.

 Given an integer n and an integer array ranges of length n + 1 where ranges[i] (0-indexed) means the i-th tap can water the area [i - ranges[i], i + ranges[i]] if it was open.

 Return the minimum number of taps that should be open to water the whole garden, If the garden cannot be watered return -1.
 */

/**
 can treat as a dp problem (prefix-ordered)
 - maintain max right-value, with left side starting at zero
 - for each item, if not extending right value, don't take
 - for each item if extending the right value, if left side > previous max.min, store previous & start new
 - if left side <= previous max.min bounded by zero, drop previous and start new
 - will need to check for gaps...
 - we could pre-sort the ranges by left bound, so the check is in-line (O(n lg n)) space (O(1))
 - we can iterate the stored ranges at the end and check for gaps, (O(n)) space (O(n))
 */
func minTaps(_ n: Int, _ ranges: [Int]) -> Int {
    
    var accepted: [(Int, Int)] = []
    var currMax: Int = Int.min
    var currMin: Int = Int.max
    
    
    for (index, r) in ranges.enumerated() {
        guard r > 0 else { continue }
        if index + r > currMax { // we'll use the range
            let _min = max(0, index-r) // get lowerbound
            if _min <= currMin {    // drop previous, replace with current
                currMin = _min
                currMax = index + r
            } else {    // accept previous, start new
                accepted.append((currMin, currMax))
                currMin = _min
                currMax = index + r
            }
        }
    }
    
    // handle un-recorded range
    if accepted.isEmpty {
        accepted.append((currMin, currMax))
    } else if let last = accepted.last,
       currMax > last.1 {
        accepted.append((currMin, currMax))
    }
    
    // check for gaps
    if accepted.count > 1 {
        for i in 1..<accepted.count {
            if accepted[i].0 > accepted[i - 1].1 + 1 {
                return -1
            }
        }
    }
    
    // check ends
    guard let first = accepted.first,
          let last = accepted.last,
          first.0 <= 0,
          last.1 >= ranges.count - 1 else { return -1 }
    
    return accepted.count
}
