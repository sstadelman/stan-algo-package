//
//  File.swift
//  
//
//  Created by Stan Stadelman on 3/12/21.
//

import Foundation

// Category:  Greedy Algorithm
// seeking local solution which leads to globally optimal solution

/**
 Constraints:
    1. activity starts at (si) finishes at (fi)
    2. acitvity ai and aj are compatible if the intervals do not overlap (si >= fj)
    3. activities are sorted monotonically increasing order of finish time
 Output:
  - maximum size set of compatible activites
 Stream-of-consciousness
  - think about dynamic programming solution
  - looking for subproblems to use as optimial solution
  - lead to greedy option with recursive structure
 
   + from one perspective the problem is to maximize the number of activities which can execute in the remaining time (after f(k))
        - evaluating this could mean iterating through the list of items sorted by finish, and tabulating the number of possible activities to start after f(k)
        - then pick the next item with the highest number of available activities, removing it from the set.
        - another structure with higher memory is to maintain the actual set of avaialble indices per activity,
            // question : do we need to re-scan after picking each item?  or are the values of the initial scan valid throughout?  tbd
 
 */

//fileprivate let activities: [ClosedRange<Int>] = [
//    1...4,
//    3...5,
//    0...6,
//    5...7,
//    3...9,
//    5...9,
//    6...10,
//    8...11,
//    8...12,
//    2...14,
//    12...16
//]

typealias Activity = ClosedRange<Int>

func resourceScheduling(_ activities: [Activity]) -> Set<Activity>  {
    guard activities.count > 0 else { return [] }
    
    var completed: Set<Activity> = [activities[0]]
    var currentActivityIndex = 0
    
    while currentActivityIndex < activities.count {
        guard let nextActivityIndex = activities[currentActivityIndex...].firstIndex(where: { $0.lowerBound >= activities[currentActivityIndex].upperBound }) else {
            break
        }
        completed.insert(activities[nextActivityIndex])
        currentActivityIndex = nextActivityIndex
    }
    return completed
}


