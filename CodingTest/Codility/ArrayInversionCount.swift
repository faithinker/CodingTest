//
//  ArrayInversionCount.swift
//  CodingTest
//
//  Created by jhkim on 2026.03.02.
//

import Foundation

/// [ArrayInversionCount](https://app.codility.com/programmers/trainings/4/)
/// 병합 정렬(Merge Sort), 분할 정복 앞에 있는 수가 뒤에 있는 수보다 큰 경우 역전시킴
/// 브루트 포스 -> 정렬 -> 정렬하면서 동시에 센다.
class ArrayInversionCount {
    
    public func solution1(_ A : inout [Int]) -> Int {
        
        var count = 0
        
        for i in 0..<A.count {
            for j in (i+1)..<A.count {
                if A[i] > A[j] {
                    count += 1
                }
            }
        }
        
        return count > 1000000000 ? -1 : count
    }

    // 1. mergeSort 함수: 배열을 반으로 쪼개고 재귀 호출
    // 2. merge 함수: 두 정렬된 배열을 합치면서 역전 수 카운팅
    public func solution(_ A : inout [Int]) -> Int {
        
        // 합쳐진 정렬된 배열, 역전 수
        func merge(_ start: [Int], _ end: [Int]) -> ([Int], Int) {
            
            var leftIndex = 0
            var rightIndex = 0
            var result: [Int] = []
            var inversedCount = 0
            
            while leftIndex < start.count && rightIndex < end.count {
                if start[leftIndex] <= end[rightIndex] {
                    result.append(start[leftIndex])
                    leftIndex += 1
                } else {
                    result.append(end[rightIndex])
                    inversedCount += start.count - leftIndex
                    rightIndex += 1
                }
            }
            
            let remainLeft = Array(start[leftIndex...])
            let remainRight = Array(end[rightIndex...])
            result += remainLeft
            result += remainRight
            
            return (result, inversedCount)
        }
        
        func mergeSort(_ arr: [Int]) -> ([Int], Int) {
            if arr.count == 1 { return (arr, 0)}
            
            // 반으로 쪼개서 재귀
            let left = mergeSort(Array(arr[0..<arr.count/2]))
            let right = mergeSort(Array(arr[arr.count/2..<arr.count]))
            
            // 합치기
            let result = merge(left.0, right.0)
            
            // return (합쳐진 배열, 왼쪽 역전수 + 오른쪽 역전수 + 합치기 역전수)
            return (result.0, left.1 + right.1 + result.1)
        }
        
        let result = mergeSort(A).1
        
        return result > 1000000000 ? -1 : result
    }


    //mergeSort(배열) {
    //    // 1개면 그대로 리턴 (쪼갤 수 없으니까)
    //    if 배열 크기 == 1 → return (배열 그대로, 역전 0)
    //
    //    // 반으로 쪼개서 재귀
    //    (정렬된 왼쪽, 왼쪽 역전수) = mergeSort(왼쪽 절반)
    //    (정렬된 오른쪽, 오른쪽 역전수) = mergeSort(오른쪽 절반)
    //
    //    // 합치기
    //    (합쳐진 배열, 합치기 역전수) = merge(정렬된 왼쪽, 정렬된 오른쪽)
    //
    //    return (합쳐진 배열, 왼쪽 역전수 + 오른쪽 역전수 + 합치기 역전수)
    //}
    //
    //merge(왼쪽 배열, 오른쪽 배열) {
    //    왼쪽 인덱스 = 0
    //    오른쪽 인덱스 = 0
    //    결과 배열 = 빈 배열
    //    역전수 = 0
    //
    //    // 둘 다 남아있는 동안 반복
    //    while 왼쪽 인덱스 < 왼쪽 크기 && 오른쪽 인덱스 < 오른쪽 크기 {
    //        if 왼쪽 값 <= 오른쪽 값 {
    //            결과에 왼쪽 값 넣기
    //            왼쪽 인덱스 += 1
    //        } else {
    //            결과에 오른쪽 값 넣기
    //            역전수 += 왼쪽에 남은 개수
    //            오른쪽 인덱스 += 1
    //        }
    //    }
    //
    //    // 한쪽이 남아있으면 나머지 전부 결과에 넣기
    //
    //    return (결과 배열, 역전수)
    //}

    var a = [-1, 6, 3, 4, 7, 4]
    var b = [6, 3, 4, 1]

    //print(solution(&a))
    //print(solution(&b))

}
