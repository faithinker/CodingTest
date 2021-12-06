//
//  Two_Sum.swift
//  CodingTest
//
//  Created by pineone on 2021/12/06.
//

import Foundation

class Two_Sum {
    // [two Sum](https://leetcode.com/problems/two-sum/)
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        
        var intArr = [Int]() // 빈 배열 생성
        
        nums.enumerated().forEach {
            
            // $0.element는 첫번째 값, remainder는 나머지 값(두번째 값)
            let remainder = target - $0.element
            
            // 첫번째 값 다음부터 배열 끝까지 순회한다.
            for i in $0.offset + 1 ..< nums.count {
                
                // 만약 나머지(두번째 값)가 같다면 배열에 값 추가 후, 종료.
                // 원래는 여기서 return[$0.offset, i] 를 할려 했지만 컴파일 에러로 인해, 빈배열을 생성함
                if remainder == nums[i] {
                    intArr.append($0.offset)
                    intArr.append(i)
                    break
                }
            }
        }
        
        return intArr
    }
    // 좀 더 성능 좋은 로직을 만든다면... 퀵정렬의 피봇(중간값 이용)
    // 1. nums 배열을 (오름차순으로) 정렬한다. => newNums
    // 2. target이 주어졌을때 remainder = target - newNums[0]
    // 3. 만약 나머지(remainder)가 크다면, newNums의 중간값과 비교를 해서 찾는다.
    // 4-1) 중간값 > 나머지면 중간값 이하의 자릿수부터 매핑한다. newNums[0] + newNums[중간값의 자리 - 1]
    // 4-2) 중간값 < 나머지면 중간값 이상의 자릿수부터 매핑한다. newNums[0] + newNums[중간값의 자리 + 1]
    // 바로 4-1),4-2) 과정을 들어가는 것보다 4-1)일때는 0~중간값 사이에 또 그 중간값을 찾고, 4-2)일때는 중간값~끝값 사이의 중간값을 찾는다.
}


