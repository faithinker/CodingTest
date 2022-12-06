//
//  Combination.swift
//  CodingTest
//
//  Created by jhkim on 2022/12/06.
//

import Foundation

// 조합 : n개의 원소를 갖는 집합에서 r개의 원소를 선택하는 것.  순서 X

class Combination {
    
    func combination<T: Comparable>(_ array: [T], _ n: Int) -> [[T]] {
        var result = [[T]]()
        if array.count < n { return result }

        var stack = array.enumerated().map { ([$0.element], $0.offset) }
        
        while stack.count > 0 {
            print(stack)
            let now = stack.removeLast()
            
            let elements = now.0
            let index = now.1
            
            if elements.count == n {
                result.append(elements.sorted())
                continue
            }
            
            guard index+1 < array.count-1 else { continue }
            
            for i in index+1...array.count-1 {
                stack.append((elements + [array[i]], i))
            }
            
        }
        
        return result
    }
    
    func combi<T: Comparable>(_ array: [T], _ n: Int) -> [[T]] {
        var result = [[T]]()
        if array.count < n { return result }

        func cycle(_ index: Int, _ now: [T]) {
            if now.count == n {
                result.append(now)
                return
            }
            
            for i in index..<array.count {
                cycle(i + 1, now + [array[i]])
            }
        }
        
        cycle(0, [])
        
        return result
    }
    
}
