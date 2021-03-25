import XCTest
@testable import PrimitiveStructures
@testable import Problems

final class ListTests: XCTestCase {
    func testReverseKNodes() {
        var list = List<Int>()
        for i in [1,2,3,4,5,6] {
            list.append(i)
        }
        let node = reverseKGroup(list.head, 2)!
        XCTAssert(node.description == "2, 1, 4, 3, 6, 5", node.description)
        
        var list2 = List<Int>()
        for i in [1,2,3,4,5] {
            list2.append(i)
        }
        XCTAssert(reverseKGroup(list2.head, 3)!.description == "3, 2, 1, 4, 5")

    }
}

