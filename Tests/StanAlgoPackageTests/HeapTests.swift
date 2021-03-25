import XCTest
@testable import PrimitiveStructures

final class HeapTests: XCTestCase {
    
    func testMaxHeapInsert() {
        var heap = Heap<Int>(>)
        
        heap.insert(0)
        XCTAssert(heap.data == [0])
        
        heap.insert(10)
        XCTAssert(heap.data == [10, 0], String(describing: heap.data))
        
        heap.insert(5)
        XCTAssert(heap.data == [10, 0, 5], String(describing: heap.data))
        
        heap.insert(15)
        XCTAssert(heap.data == [15, 10, 5, 0], String(describing: heap.data))
        
        heap.raisePriorityOf(valueAt: 2, to: 18)
        XCTAssert(heap.data == [18, 10, 15, 0], String(describing: heap.data))
        
        heap.raisePriorityOf(valueAt: 3, to: 19)
        XCTAssert(heap.data == [19, 18, 15, 10], String(describing: heap.data))
        
        let val = heap.extractNext()
        XCTAssert(val == 19)
        XCTAssert(heap.data == [18, 10, 15], String(describing: heap.data))
        
        heap.insert(9)
        heap.insert(16)
        heap.insert(17)
        XCTAssert(heap.data == [18, 16, 17, 9, 10, 15], String(describing: heap.data))
        
        let state = [18, 16, 17, 9, 10, 15].sorted(by: >)
        XCTAssert(heap.data.count == state.count)
        
        for i in state {
            let val = heap.extractNext()
            XCTAssert(val == i, "val: \(val) i: \(i)")
        }
        XCTAssert(heap.isEmpty)
    }
    
    func testBuildMaxHeap() {
        var heap = Heap<Int>(>)
        heap.buildStructure([7, 10, 20, 3, 4, 49, 50])
        XCTAssert(heap.data == [50, 10, 49, 3, 4, 7, 20], String(describing: heap.data))
    }
    
    func testMinHeapInsert() {
        var heap = Heap<Int>(<)
        
        heap.insert(3)
        XCTAssert(heap.data == [3])
        
        heap.insert(10)
        XCTAssert(heap.data == [3, 10], String(describing: heap.data))
        
        heap.insert(5)
        XCTAssert(heap.data == [3, 10, 5], String(describing: heap.data))
        
        heap.insert(15)
        XCTAssert(heap.data == [3, 10, 5, 15], String(describing: heap.data))
        
        heap.raisePriorityOf(valueAt: 2, to: 2)
        XCTAssert(heap.data == [2, 10, 3, 15], String(describing: heap.data))
        
        heap.raisePriorityOf(valueAt: 3, to: 1)
        XCTAssert(heap.data == [1, 2, 3, 10], String(describing: heap.data))
        
        let val = heap.extractNext()
        XCTAssert(val == 1)
        XCTAssert(heap.data == [2, 10, 3], String(describing: heap.data))
        
        heap.insert(2)
        heap.insert(1)
        heap.insert(5)
        XCTAssert(heap.data == [1, 2, 3, 10, 2, 5], String(describing: heap.data))
        
        let state = [1, 2, 3, 10, 2, 5].sorted(by: heap.comparator)
        XCTAssert(heap.data.count == state.count)
        
        for i in state {
            let val = heap.extractNext()
            XCTAssert(val == i, "val: \(val) i: \(i)")
        }
        XCTAssert(heap.isEmpty)
    }
    
    func testBuildMinHeap() {
        var heap = Heap<Int>(<)
        heap.buildStructure([7, 10, 20, 3, 4, 49, 50])
        XCTAssert(heap.data == [3, 4, 20, 10, 7, 49, 50], String(describing: heap.data))
    }
    
    func testMaxHeapMapInsert() {
        var heap = HeapMap<Int>(>)
        
        heap.insert(0)
        XCTAssert(heap.data == [0])
        
        heap.insert(10)
        XCTAssert(heap.data == [10, 0], String(describing: heap.data))
        
        heap.insert(5)
        XCTAssert(heap.data == [10, 0, 5], String(describing: heap.data))
        
        heap.insert(15)
        XCTAssert(heap.data == [15, 10, 5, 0], String(describing: heap.data))
        
        heap.raisePriorityOf(valueAt: 2, to: 18)
        XCTAssert(heap.data == [18, 10, 15, 0], String(describing: heap.data))
        
        heap.raisePriorityOf(valueAt: 3, to: 19)
        XCTAssert(heap.data == [19, 18, 15, 10], String(describing: heap.data))
        
        let val = heap.extractNext()
        XCTAssert(val == 19)
        XCTAssert(heap.data == [18, 10, 15], String(describing: heap.data))
        
        heap.insert(9)
        heap.insert(16)
        heap.insert(17)
        XCTAssert(heap.data == [18, 16, 17, 9, 10, 15], String(describing: heap.data))
        
        let state = [18, 16, 17, 9, 10, 15].sorted(by: >)
        XCTAssert(heap.data.count == state.count)
        
        for i in state {
            let val = heap.extractNext()
            XCTAssert(val == i, "val: \(val) i: \(i)")
        }
        XCTAssert(heap.isEmpty)
    }
    
    func testBuildMaxHeapMap() {
        var heap = HeapMap<Int>(>)
        heap.buildStructure([7, 10, 20, 3, 4, 49, 50])
        XCTAssert(heap.data == [50, 10, 49, 3, 4, 7, 20], String(describing: heap.data))
    }
    
    func testMinHeapMapInsert() {
        var heap = HeapMap<Int>(<)
        
        heap.insert(3)
        XCTAssert(heap.data == [3])
        
        heap.insert(10)
        XCTAssert(heap.data == [3, 10], String(describing: heap.data))
        
        heap.insert(5)
        XCTAssert(heap.data == [3, 10, 5], String(describing: heap.data))
        
        heap.insert(15)
        XCTAssert(heap.data == [3, 10, 5, 15], String(describing: heap.data))
        
        heap.raisePriorityOf(valueAt: 2, to: 2)
        XCTAssert(heap.data == [2, 10, 3, 15], String(describing: heap.data))
        
        heap.raisePriorityOf(valueAt: 3, to: 1)
        XCTAssert(heap.data == [1, 2, 3, 10], String(describing: heap.data))
        
        let val = heap.extractNext()
        XCTAssert(val == 1)
        XCTAssert(heap.data == [2, 10, 3], String(describing: heap.data))
        
        heap.insert(4)
        heap.insert(1)
        heap.insert(5)
        XCTAssert(heap.data == [1, 2, 3, 10, 4, 5], String(describing: heap.data))
        
        
        for i in 0..<heap.data.count {
            XCTAssert(heap.map[heap.data[i], default: Int.min] == i)
        }
        
        let state = [1, 2, 3, 10, 4, 5].sorted(by: heap.comparator)
        XCTAssert(heap.data.count == state.count)
        
        for i in state {
            let val = heap.extractNext()
            XCTAssert(val == i, "val: \(val) i: \(i)")
        }
        XCTAssert(heap.isEmpty)
    }
    
    func testBuildMinHeapMap() {
        var heap = HeapMap<Int>(<)
        heap.buildStructure([7, 10, 20, 3, 4, 49, 50])
        XCTAssert(heap.data == [3, 4, 20, 10, 7, 49, 50], String(describing: heap.data))
    }
}
