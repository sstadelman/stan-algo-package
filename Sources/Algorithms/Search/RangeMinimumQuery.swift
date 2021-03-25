//
//  File.swift
//  
//
//  Created by Stan Stadelman on 3/16/21.
//
import PrimitiveStructures
import Foundation
// Can we answer all these problems in O(1)?

// Range Minimum Query (RMQ)
// find minimum in a range of ints

// A[i], A[i + 1], ..., A[j]
// find minimum index `k` in A[i...j]

// closely related to Lowest Common Ancestor (LCA problem
// query LCA(x, y)

// Level Ancestor (LA)
// query given node and int `k`, find k'th ancestor of node


/**
 to reduce from Array to tree, a Cartesian tree bridges from RMQ and LCA
 
 root of T = min element A[i] of A
 left subtree = Cartesian tree on A[<i]
 right subtree = Cartesian tree on A[>i]

 */

// 8, 7, 2, 8, 6, 9, 4, 5
// min is 2, so it becomes root
// on left side 7 is min, so it becomes root,
// on right side, 4 is min so it becomes root
//    2
//  7       4
// 8      6      5
//      8   9

// this happens to be a minHeap (Cartesian tree == minHeap)

// LCA's in this tree correlate to RMQ in the array query (because each node is the RMQ of its own tree)
// LCA(i, j) == RMQ[A](i, j)

// This reduction can be done in linear time O(n)  // same as building a compressed trie

public extension CartesianTree {
    func rangeMinimum(from i: Int, to j: Int) {
        
    }
    
    func levelAncestor(of i: Int, and j: Int) {
        // 1. jump pointers O(n lg n) space, O(lg n) query
            // each node stores pointer to the 2^ith ancestor for 0..<lg n
            // query algorithm for O(lg n) :
                // x = 2 ^ floor(lg k)th ancestor of x
                // k = k - 2 ^ floor(log k)
                // k will be k < k/2
        // 2. long path decomposition  O(n) space, O(sqrt(n)) query
            // find longest root to leaf path in tree
            // store each path as an array of node pointers, ordered by depth
            // query algorithm for O(sqrt(n))
                // every node belongs to a path, and every node stores pointer to the array it lives in
                // if k <= index i of node x
                //  ie (if k'th ancestor is in the path,) return path array[i - k]
                // else:
                    // x = parent(path array[0])
                    // k = k - 1 (jumps us up a level)
        // 3. ladder decomposition O(n) space, O(lg n) query
            // take paths in long path decomposition, and extend each path upward by 2x
                // creates a 'ladder'
                // paths overlap
                // at most double space of long path, so still linear
                // Node stores a pointer to the ladder that contains it in the lower half (it's original long path decomp)
                // Node also stores the index in the array
                // look at index of 
    }
}
