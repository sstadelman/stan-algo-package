//
//  File.swift
//  
//
//  Created by Stan Stadelman on 3/14/21.
//

import Foundation

//
//    func gcf(_ numbers: [Int]) -> Int {
//        guard numbers.count > 0 else { preconditionFailure() }
//        let numbers = numbers.sorted()
//        let smallest = numbers[0]
//        var factors: [Int] = []
//        for i in (1...smallest).reversed() {
//            if smallest.isMultiple(of: i) {
//                factors.append(i)
//            }
//        }
//        var j = 0
//        factorloop: while j < factors.count {
//            numberloop: for n in numbers[1...] {
//                guard n.isMultiple(of: factors[j]) else {
//                    j += 1
//                    continue factorloop
//                }
//            }
//        }
//        return factors[j]
//    }
