//
//  Permutation.swift
//  CodingTest
//
//  Created by jhkim on 2022/12/06.
//

import Foundation


// 출처 : https://velog.io/@qwer15417/Swift-순열과-조합
// 순열 : 서로 다른 n개의 원소에서 r개를 중복없이 순서에 상관있게 선택하는 혹은 나열하는 것

class Permutation {
    
    // Main.swift에서 Call 하여 사용!!
//    let permute = Permutation()
//    let result = permute.permutation([1, 2, 3], 3)
//    print("result: \(result), Count : \(result.count)")
    
    /// 스택 사용
    /// - array: 배열
    /// - n: 조합할 갯수
    func permutation<T: Comparable>(_ array: [T], _ n: Int) -> [[T]] {
        var result = [[T]]()
        if array.count < n { return result }

        var stack: [([T], [Bool])] = array.enumerated().map {
            var visited = Array(repeating: false, count: array.count)
            visited[$0.offset] = true
            return ([$0.element], visited)
        }
        
        while stack.count > 0 {
            let now = stack.removeLast()
            
            let elements = now.0
            var visited = now.1
            
            if elements.count == n {
                result.append(elements)
                continue
            }
            
            for i in 0...array.count-1 {
                if visited[i] { continue }
                visited[i] = true
                stack.append((elements + [array[i]], visited))
                visited[i] = false
            }
        }
        
        return result
    }

    /// 재귀함수 사용
    func permute<T: Comparable>(_ array: [T], _ n: Int) -> [[T]] {
        var result = [[T]]()
        if array.count < n { return result }

        var visited = Array(repeating: false, count: array.count)
        
        func cycle(_ now: [T]) {
            if now.count == n {
                result.append(now)
                return
            }
            
            for i in 0..<array.count {
                if visited[i] {
                    continue
                } else {
                    visited[i] = true
                    cycle(now + [array[i]])
                    visited[i] = false
                }
            }
        }
        
        cycle([])
        
        return result
    }
    
}
