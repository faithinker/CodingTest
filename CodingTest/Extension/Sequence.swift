//
//  Sequence.swift
//  CodingTest
//
//  Created by jhkim on 2022/12/06.
//

import Foundation

// 출처 : https://lygon55555.medium.com/스위프트에서-배열의-중복되는-원소-제거하는-방법-d3518f59486b

extension Sequence where Element: Hashable {
    /// 배열의 중복된 원소 제거
    func uniqued() -> [Element] {
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
    }
    
    /// Array -> Set Type 변경
    func toSet() -> Set<Element> {
        var set = Set<Element>()
        self.forEach {
            set.insert($0)
        }
        return set
    }
}

extension Array where Element: Hashable {
    /// A와 B 배열의 차집합을 반환(A-B)
    func subtract(_ other: [Element]) -> [Element] {
        var temp = self
        
        other.forEach {
            if let index = temp.firstIndex(of: $0) {
                temp.remove(at: index)
            }
        }
        return temp
    }
}
