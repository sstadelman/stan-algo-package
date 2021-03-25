import Foundation
import PrimitiveStructures
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */

/**

Constraint:
 - should iterate linearly
 - will need to maintain next links of items being re-ordered
 - will need to connect tail of previous node to new head of re-ordered segment
 - will need to connect tail of re-ordered segment to head of remaining list

Approach:
 - create subroutine which reverses sublist
 - maintain a running current node which becomes head of the sublist
 - maintain a tmp tail node which holds the tail of the sorting sublist
 - merge together
*/



typealias ListNode = List<Int>.Node

func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
    
    guard let _head = head, k > 1 else { return head }
    
    // requires tail node to be trimmed (next == nil)
    func reverseSublist(_ head: ListNode, k: Int) -> (sorted: ListNode, prefixTail: ListNode?) {
        
        var tail: ListNode? = head
        for _ in 0..<k {
            guard tail != nil else { return (head, nil) }
            tail = tail?.next
        }
        
        var newHead = head
        var newTail = newHead
        var curr = head.next
        newHead.next = nil
        
        while curr != tail {
            let tmp = curr!.next
            curr!.next = newHead
            newHead = curr!
            curr = tmp
        }
        newTail.next = tail
        return (newHead, newTail)
    }
    
    var curr: ListNode? = _head
    var newHead: ListNode? = nil
    var trailingNext: ListNode? = nil
    var index = 0
    
    
    outerloop: while curr != nil {
        if newHead == nil {
            let reversed = reverseSublist(_head, k: k)
            newHead = reversed.sorted
            curr = reversed.prefixTail
        } else {
            trailingNext = curr
            if let next = trailingNext?.next {
                let reversed = reverseSublist(next, k: k)
                trailingNext?.next = reversed.sorted
                curr = reversed.prefixTail
            } else {
                break outerloop
            }
        }
    }
    
    return newHead
    
}
