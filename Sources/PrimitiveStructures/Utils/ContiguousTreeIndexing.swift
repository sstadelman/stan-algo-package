//
//  File.swift
//  
//
//  Created by Stan Stadelman on 3/12/21.
//

import Foundation

// MARK: - Utility index interfaces reusable across Heaps
protocol ContiguousTreeIndexing {
    func left(_ i: Int) -> Int
    func right(_ i: Int) -> Int
    func parent(of i: Int) -> Int
    
}

extension ContiguousTreeIndexing {
    func left(_ i: Int) -> Int {
        i * 2 + 1
    }
    
    func right(_ i: Int) -> Int {
        left(i) + 1
    }
    
    func parent(of i: Int) -> Int {
        (i - 1) / 2
    }
    
}
