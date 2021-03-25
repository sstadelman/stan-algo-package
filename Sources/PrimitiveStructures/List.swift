//
//  File.swift
//  
//
//  Created by Stan Stadelman on 3/15/21.
//

import Foundation

open class List<T>: CustomStringConvertible where T: Equatable {
    
    public class Node: Equatable, CustomStringConvertible {
        public static func == (lhs: List.Node, rhs: List.Node) -> Bool {
            lhs.val == rhs.val && lhs.next === rhs.next
        }
        
        public var val: T
        public var next: Node?
        public var prev: Node?

        public init(_ val: T) {
            self.val = val
            self.next = nil
            self.prev = nil
        }
        public init(_ val: T, _ next: Node?) {
            self.val = val
            self.next = next
            self.prev = nil
        }
        
        public var description: String {
            var output: [T] = []
            var curr: Node? = self
            while curr != nil {
                output.append(curr!.val)
                curr = curr?.next
            }
            return output.map({ "\($0)" }).joined(separator: ", ")
        }
    }
    
    public private(set) var head: Node?
    private var tail: Node?
    private var count: Int = 0

    @discardableResult
    public func insert(_ value: T) -> Node {
        guard self.head != nil else {
            return insertEmpty(value)
        }
        let new = Node(value)
        new.next = head
        head?.prev = new
        self.head = new
        count += 1
        return new
    }
    
    @discardableResult
    public func append(_ value: T) -> Node {
        guard self.head != nil else {
            return insertEmpty(value)
        }
        let new = Node(value)
        tail?.next = new
        new.prev = tail
        tail = tail?.next
        count += 1
        return new
    }
    
    @discardableResult
    func remove(_ node: Node) -> Node? {
        guard head != nil else { return nil }
        var curr = head
        while curr != nil && curr?.next !== node {
            curr = curr?.next
        }
        
        if let curr = curr,
           let n = curr.next,
           n === node {
            n.next?.prev = curr
            curr.next = n.next
            count -= 1
            n.next = nil
            n.prev = nil
            return n
        }
        return nil
    }
    
    public func insert(_ node: Node) {
        node.next = head
        head?.prev = node
        self.head = node
        count += 1
    }
    
    public func popLast() -> Node? {
        tail = tail?.prev
        let tmp = tail?.next
        tail?.next = nil
        return tmp
    }

    public var description: String {
        return head?.description ?? "isEmpty"
    }
}

extension List {
    @discardableResult
    fileprivate func insertEmpty(_ value: T) -> Node {
        self.head = Node(value)
        self.tail = head
        self.count = 1
        return self.head!
    }
}
