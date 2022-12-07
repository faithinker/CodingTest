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
}
