//
//  File.swift
//  
//
//  Created by Stan Stadelman on 3/15/21.
//

import Foundation

/**
 Constraints:
  - rod increments are integral
  - identify the maximum revenue which can be derived by cutting a rod of length j
 
 Approach:
  - we have a subproblem which is:  what is the maximum revenue which can be derived from rod length j - m
    - i is cut length
  - our dp is:  maximum of not cutting, and cutting
    - need to acount for cases where there are mutiple cuts which could be made in the same column
         - `max( dp[i + 1][j]` ` // don't cut, take previous value
         -               `Vi + dp[i][j - Si]` // if cutting, take the value of the cut plus the prior value of the cut in this column
 // in this case Si == i, since the item is a cut of length `i`
  - solution will be at: dp[0, maxLength]
  - Does input set require topo sort?  Should sort so that we test smallest cut length ... largest,
 */
func maxRevenue(from rodPrices: [(Int, Int)], maxLength: Int) -> Int {
    
    let rodPrices = rodPrices.sorted(by: { $0.0 > $1.0 })
    
    var dp: [[Int]] = []
    let row = Array(repeating: 0, count: maxLength + 1)
    
    for _ in 0...rodPrices.count {
        dp.append(row)
    }

    for i in (0..<rodPrices.count).reversed() {
        for j in 1...maxLength {
            let dontCut = dp[i + 1][j]
            var cut = 0
            if j - rodPrices[i].0 >= 0 {
                cut = rodPrices[i].1 + dp[i][j - rodPrices[i].0]
            }
            dp[i][j] = max(dontCut, cut)
        }
    }
    return dp[0][maxLength]
}

//func memoizedCutRodMaxRevenue(from rodPrices: [(Int, Int)], maxLength: Int) -> Int {
//    func memoizedCutRodAux(from p: [(Int, Int)], maxLength n: Int, memo r: inout [Int]) -> Int {
//        guard r[n] < 0 else {
//            return r[n]
//        }
//        var q = n == 0 ? 0 : Int.min
//        for i in 0..<n {
//            q = max(q, rodPrices[i].1 + memoizedCutRodAux(from: rodPrices, maxLength: n - 1, memo: &r))
//        }
//        r[n] = q
//        return q
//    }
//    var r = Array(repeating: Int.min, count: maxLength + 1)
//    
//    return memoizedCutRodAux(from: rodPrices, maxLength: maxLength, memo: &r)
//}
