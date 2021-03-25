//
//  File.swift
//  
//
//  Created by Stan Stadelman on 3/24/21.
//

import Foundation

protocol MergeableHeapADT {
    associatedtype T: Comparable & Hashable
    func makeHeap()
    func insert(_ newValue: T)
    func minimum() -> UnsafePointer<T>
    func extractMin() -> UnsafePointer<T>
    func union(_ h2: Self) -> Self
}
