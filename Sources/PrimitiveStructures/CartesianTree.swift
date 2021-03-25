//
//  File.swift
//  
//
//  Created by Stan Stadelman on 3/16/21.
//

import Foundation

// used for efficient range minimum queries
open class CartesianTree<T>: BinaryTree<T> where T: Comparable {
    
    open class func buildStructure(_ array: [T]) -> CartesianTree<T>? {
        
        func util(root: Int, array: [T], left: [Int], right: [Int]) -> CartesianTree<T>? {
            guard root != -1 else {
                return nil
            }
            var tmp = CartesianTree<T>(array[root])
            tmp.left = util(root: left[root], array: array, left: left, right: right)
            tmp.right = util(root: right[root], array: array, left: left, right: right)
            return tmp
        }
        
        guard array.count > 0 else { return nil }

        var parent: [Int] = .init(repeating: -1, count: array.count)
        var left: [Int] = parent
        var right = parent
        
        var root = 0
        var last = 0
        
        for i in 1..<array.count {
            right[i] = -1
            last = i - 1
            
            while array[last] <= array[i],
                  root != last {
                last = parent[last]
            }
            
            if array[last] <= array[i] {
                parent[root] = i
                left[i] = root
                root = i
            } else if right[last] == -1 {
                right[last] = i
                parent[i] = last
                left[i] = -1
            } else {
                parent[right[last]] = i
                left[i] = right[last]
                right[last] = i
                parent[i] = last
            }
        }
        
        parent[root] = -1
        
        return util(root: root, array: array, left: left, right: right)
    }
    
}

public extension BinaryTree {
    func inorderDepth(level: Int, _ action: (T, Int) -> Void) {
        self.left?.inorderDepth(level: level + 1, action)
        action(value, level)
        right?.inorderDepth(level: level + 1, action)
    }
    
    
}
