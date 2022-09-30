//
//  File.swift
//  
//
//  Created by Stan Stadelman on 3/15/21.
//

import Foundation

open class BinarySearchTree<T>: BinaryTree<T> where T: Comparable {
    
    open override func insert(_ newValue: T) {
        switch (newValue, left, right) {
            case let (n, .none, _) where n <= value:
                left = Self(n, maintenance: maintenance)
            case let (n, .some(l), _) where n < value:
                l.insert(n)
            case let (n, _, .none) where n >= value:
                right = Self(n, maintenance: maintenance)
            case let (n, _, .some(r)) where n > value:
                r.insert(n)
            case let (n, .some(l), .some(r)) where n == value:
                if Bool.random() {
                    l.insert(n)
                } else {
                    r.insert(n)
                }
            default:
                preconditionFailure()
        }
        maintenance?(self)
    }
}
