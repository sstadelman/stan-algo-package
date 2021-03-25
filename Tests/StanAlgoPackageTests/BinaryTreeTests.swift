import XCTest
@testable import PrimitiveStructures
@testable import Algorithms
@testable import Problems

final class BinaryTreeTests: XCTestCase {
    
    func testIsBST() {
        let list = [2, -10, -45, 200, 48, 10, 38, 47, 4, 2, 5]
        var tree = BinaryTree<Int>(2)
        for i in list[1...] {
            tree.insert(i)
        }
        
        let test = isBST(tree)
        XCTAssertFalse(test, tree.description)
        
        let shortTree = BinaryTree(1)
        XCTAssert(isBST(shortTree))
        
        let bst = BinarySearchTree(2)
        for i in list[1...] {
            bst.insert(i)
        }
        let bstTest = isBST(bst)
        XCTAssertFalse(bstTest, bst.description)
    }
    
    func isBST(_ binaryTree: BinaryTree<Int>) -> Bool {
        
        var prev: Int = Int.min
        do {
            try binaryTree.inorderTraversal { value in
                guard value >= prev else {
                    throw BinarySearchTree<Int>.Error.unsorted
                }
                prev = value
            }
        } catch {
            return false
        }
        
        return true
    }
}
