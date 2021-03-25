//
//  File.swift
//  
//
//  Created by Stan Stadelman on 3/15/21.
//

import Foundation

class LRUCache<T>: List<T> where T: Hashable {
    
    private var map: [T: List<T>.Node] = [:]
    private let capacity: Int
    
    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func get(_ key: T) -> T {
        guard let node = map[key],
              let tmp = self.remove(node) else { preconditionFailure() }
        assert(node === tmp)
        insert(tmp)
        return tmp.val
    }
    
    func put(_ key: T, _ value: T) {
        guard let node = map[key] else {
            while map.count > capacity,
                  let del = popLast() {
                map.removeValue(forKey: del.val)
            }
            let new = insert(value)
            map[key] = new
            return
        }
        node.val = value
    }
}
