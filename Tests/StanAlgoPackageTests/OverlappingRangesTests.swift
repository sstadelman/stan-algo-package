import XCTest
@testable import Problems

final class OverlappingRangesTests: XCTestCase {
    
    func testOverlappingSprinklers() {
        
        XCTAssert(minTaps(7, [1,2,1,0,2,1,0,1]) == 3)
        XCTAssert(minTaps(3, [0,0,0,0]) == -1)
        XCTAssert(minTaps(8, [4,0,0,0,4,0,0,0,4]) == 1)
        
        
    }
    
}
