//
//  File.swift
//  
//
//  Created by Stan Stadelman on 3/13/21.
//

import Foundation
import Algorithms

// https://leetcode.com/problems/search-in-rotated-sorted-array/

// problem space is:  we now have a partly sorted array, and want to find
// if it contains a value.
// the sort is predictable, such that if we can discover the index of the pivot,
// we can use binary search with log n complexity
// in principle, we could use binary search to discover the pivot,
// result in  2 log n or O(log n)

// using binary search for the the pivot in practice means we need to return the index
// of the condition where nums[k] > nums[k + 1]

// we could use Int.max as a proxy for the split, since the point at which we discover it
// doesn't exist is the point of the pivot

// might have edge case if pivot at k == 0
func search(_ nums: [Int], _ target: Int) -> Int {
    
    let pivotIndex = nums[...].indexOfPivot()
    switch nums[nums.endIndex - 1] {
        case target:
            return nums.endIndex - 1
        case target...:
            guard case let .success(index) = nums[pivotIndex..<nums.endIndex].binarySearchIndexOf(value: target) else { return -1 }
            return index
        case ..<target:
            guard case let .success(index) =  nums[nums.startIndex..<pivotIndex].binarySearchIndexOf(value: target) else { return -1 }
            return index
        default:
            preconditionFailure()
    }
}
