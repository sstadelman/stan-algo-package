//
//  File.swift
//  
//
//  Created by Stan Stadelman on 3/16/21.
//

import Foundation

// outline

// check if all numbers are identical (endpoints match)
// partition array into two segments
// recursively check left & right segments, until the endpoints match, or count == 1
    // stop when we hit success, so a breadth-first approach is ideal

public extension Array where Element == Int {

    func frequencyOfMode() -> Int {
        
        guard count > 0 else { return 0 }
        guard first! != last! else { return count }
        
        
        let maxRange = self[...].maxMatchingBoundRange()
        
        let midPoint = (endIndex - 1) / 2
        var midRangeStart: Int = midPoint
        var midRangeEnd: Int = midPoint
        for i in (0..<midPoint).reversed() {
            if self[i] == self[midPoint] {
                midRangeStart = i
            }
        }
        for j in midPoint..<endIndex {
            if self[j] == self[midPoint] {
                midRangeEnd = j
            }
        }
        
        return Swift.max((midRangeEnd - midRangeStart + 1), maxRange.count)
    }
}

extension ArraySlice where Element == Int {
    
    func maxMatchingBoundRange() -> Range<Int> {
        guard count > 1,
              first! != last! else { return startIndex..<endIndex }

        let midpoint = startIndex + (endIndex - startIndex) / 2
        let l = prefix(upTo: midpoint).maxMatchingBoundRange()
        let r = suffix(from: midpoint).maxMatchingBoundRange()
        return l.count > r.count ? l : r
    }
}
