import XCTest
@testable import PrimitiveStructures
@testable import Algorithms
@testable import Problems

final class StanAlgoPackageTests: XCTestCase {


    func testThis() {
        let items = [2, 3, -8, -1, 2, 4, -2, 3]
        var maxSum = Int.min
        var runningSum = 0
        
        for i in items {
            runningSum += i
            
            maxSum = max(maxSum, runningSum)
            runningSum = max(runningSum, 0)
        }
        XCTAssert(maxSum == 7)
    }
    
    func testCartesianTree() {
        let values = [5, 10, 40, 30, 28]
        var tree = CartesianTree<Int>.buildStructure(values)!
        XCTAssert(tree.description == "5, 10, 40, 30, 28", tree.description)
        
        var output: [(Int, Int)] = []
        var level = 0
        
        tree.inorderDepth(level: 0) { value, level in
            output.append((value, level))
        }
        
        XCTAssert(output.description == "[(5, 2), (10, 1), (40, 0), (30, 1), (28, 2)]")
        
        var eulerOutput: [Int] = []
        var pointers: [BinaryTree<Int>] = []
        try? tree.eulerTour() { node, level in
            eulerOutput.append(level)
            pointers.append(node)
            
        }
        print(eulerOutput)
    }
    
    func testFrequencyOfMode() {
        let input = [1,2,2,2,2,2,4,4,4]
        XCTAssert(input.frequencyOfMode() == 5)
    }
    
    func testCompress() {
        func compress(_ chars: inout [Character]) -> Int {
            var currentIndex: Int = chars.count - 2
            var repeatCount: Int = 0
            var compressedCount: Int = 0
            
            guard chars.count > 0 else { return chars.count }
            
            for i in (0..<chars.count - 1).reversed() {
                if chars[i] != chars[i + 1] {
                    if i < currentIndex - 1 {
                        for j in i + 1..<currentIndex {
                            chars[j] = "\n"
                        }
                    }
                    currentIndex = i
                    repeatCount = 0
                } else {
                    repeatCount += 1
                    compressedCount += 1
                    chars[currentIndex + 1] = Character(String(describing: repeatCount))
                }
            }
            return chars.count - compressedCount
        }
        
        var input: [Character] = ["a","a","b","b","c","c","c"]
        let result = compress(&input)
        print(result)
    }
}






















/*
    func isBST(_ binaryTree: BinaryTree?) -> Bool {
        guard let root = binaryTree else { return true }
    }
 */
/*
class BinaryTree {
    let val: Int
    var left: BinaryTree?
    var right: BinaryTree?
    
    init(val: Int, left: BinaryTree?, right: BinaryTree?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

extension BinaryTree {
    
    func isBST() -> Bool {
        var min = Int.min
        if left != nil {
           guard left!.inorderBSTCheck(accumulator: &min) else { return false }
        }
        guard min < val else { return false }
        min = val
        if right != nil {
           guard right!.inorderBSTCheck(accumulator: &min) else { return false }
        }
        
    }
    
    private func recursive(_ root: BinaryTree?, min: Int) -> Bool {
        if let lhs = left {
            guard lhs.val < min else { return false }
            guard lhs.recursive(root, lhs.val)
        }
    }
    private func inorderBSTCheck(accumulator: inout Int) -> Bool {

    if let lhs = left {
     guard lhs.inorderBSTCheck(accumulator: &accumulator),
           lhs.val < val else { return false }
    }
    accumulator = val
    if let rhs = right {
        
      guard rhs.val > val,
            rhs.inorderBSTCheck(accumulator: &accumulator) else { return false }
    }
    return true
}
*/
