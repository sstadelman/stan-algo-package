//
//  File.swift
//  
//
//  Created by Stan Stadelman on 3/15/21.
//

import Foundation

open class BinaryTree<T>: CustomStringConvertible where T: Comparable {
    var value: T
    var left: BinaryTree<T>? = nil
    var right: BinaryTree<T>? = nil
    
    public init(_ value: T) {
        self.value = value
    }
    
    open func insert(_ newValue: T) {
        switch (left, right) {
            case (.none, .some(_)):
                left = BinaryTree(newValue)
            case (.some(_), .none):
                right = BinaryTree(newValue)
            case let (.some(l), .some(r)):
                if Bool.random() {
                    l.insert(newValue)
                } else {
                    r.insert(newValue)
                }
            case (.none, .none):
                if Bool.random() {
                    left = BinaryTree(newValue)
                } else {
                    right = BinaryTree(newValue)
                }
        }
    }
    
    open func contains(_ value: T) -> Bool {
        preconditionFailure("not implemented")
    }
    
    open func inorderTraversal(_ action: (T) throws -> Void) throws {
        try left?.inorderTraversal(action)
        try action(value)
        try right?.inorderTraversal(action)
    }
    
    
    
    open func eulerTour(level: Int = 0, _ action: (BinaryTree<T>, Int) throws -> Void) throws {
        try action(self, level)
        if let left = left {
            try left.eulerTour(level: level + 1, action)
            try action(self, level)
        }
        if let right = right {
            try right.eulerTour(level: level + 1, action)
            try action(self, level)
        }
    }
    
    open var description: String {
        var values: [T] = []
        try? inorderTraversal {
            values.append($0)
        }
        return values.map({ String(describing: $0) }).joined(separator: ", ")
    }
}


public extension BinarySearchTree {
    enum Error: Swift.Error {
        case unsorted
    }
}
