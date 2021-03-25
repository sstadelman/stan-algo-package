//
//  File.swift
//  
//
//  Created by Stan Stadelman on 3/13/21.
//

import Foundation

extension ArraySlice where Element: Comparable {
    
    public enum SearchError: Error {
        case notFound
    }
    // return index
    public func binarySearchIndexOf(value: Element) -> Result<Int, SearchError> {
        guard count > 0 else { return .failure(.notFound) }
        
        let midpoint: Int = startIndex + (endIndex - startIndex) / 2
        
        switch self[midpoint] {
            case value:
                return .success(midpoint)
            case value...:
                return self[startIndex..<midpoint].binarySearchIndexOf(value: value)
            case ..<value:
                return self[midpoint + 1..<endIndex].binarySearchIndexOf(value: value)
            default:
                preconditionFailure()
        }
    }
}
