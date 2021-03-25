import XCTest
@testable import Problems

final class GreedyAlgorithmTests: XCTestCase {
    
    func testResourceScheduling() {
        let activities: [ClosedRange<Int>] = [
            1...4,
            3...5,
            0...6,
            5...7,
            3...9,
            5...9,
            6...10,
            8...11,
            8...12,
            2...14,
            12...16
        ]
        
        let maxActivities = resourceScheduling(activities)
        XCTAssert(maxActivities.count == 4)
    }
    
    func testZeroOneKnapsackDP() {
        let items: [KnapsackItem] = [
            .init(60, 10), .init(100, 20), .init(120, 30)
        ]
        
        let knapsack = zeroOneKnapsackDP(items, maxWeight: 50)
                
        XCTAssert(knapsack == 180, "knapsack: \(knapsack)")
    }
    
    func testRodCutting() {
        let rods = [
            (1, 1), (2, 5), (3, 8), (4, 9), (5, 10), (6, 17), (7, 17), (8, 20), (9, 24), (10, 30)
        ]
        
        
        XCTAssert(maxRevenue(from: rods, maxLength: 1) == 1)
        XCTAssert(maxRevenue(from: rods, maxLength: 2) == 5)
        XCTAssert(maxRevenue(from: rods, maxLength: 3) == 8)
        XCTAssert(maxRevenue(from: rods, maxLength: 4) == 10)
        XCTAssert(maxRevenue(from: rods, maxLength: 5) == 13)
        XCTAssert(maxRevenue(from: rods, maxLength: 6) == 17)
        XCTAssert(maxRevenue(from: rods, maxLength: 7) == 18)
        XCTAssert(maxRevenue(from: rods, maxLength: 8) == 22)
        XCTAssert(maxRevenue(from: rods, maxLength: 9) == 25)
        XCTAssert(maxRevenue(from: rods, maxLength: 10) == 30)
    }
    
//    func testRodCuttingTopDown() {
//        let rods = [
//            (1, 1), (2, 5), (3, 8), (4, 9), (5, 10), (6, 17), (7, 17), (8, 20), (9, 24), (10, 30)
//        ]
//        
//        
//        XCTAssert(memoizedCutRodMaxRevenue(from: rods, maxLength: 1) == 1)
//        XCTAssert(memoizedCutRodMaxRevenue(from: rods, maxLength: 2) == 5)
//        XCTAssert(memoizedCutRodMaxRevenue(from: rods, maxLength: 3) == 8)
//        XCTAssert(memoizedCutRodMaxRevenue(from: rods, maxLength: 4) == 10)
//        XCTAssert(memoizedCutRodMaxRevenue(from: rods, maxLength: 5) == 13)
//        XCTAssert(memoizedCutRodMaxRevenue(from: rods, maxLength: 6) == 17)
//        XCTAssert(memoizedCutRodMaxRevenue(from: rods, maxLength: 7) == 18)
//        XCTAssert(memoizedCutRodMaxRevenue(from: rods, maxLength: 8) == 22)
//        XCTAssert(memoizedCutRodMaxRevenue(from: rods, maxLength: 9) == 25)
//        XCTAssert(memoizedCutRodMaxRevenue(from: rods, maxLength: 10) == 30)
//    }
}
