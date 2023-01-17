//
//  Baekjoon_12015.swift
//  CodingTest
//
//  Created by jhkim on 2023/01/17.
//

import Foundation

/// [백준 12015][골드2] 가장 긴 증가하는 부분 수열 2(https://www.acmicpc.net/problem/12015)
/// 참조 글 : https://st-lab.tistory.com/285
/// 입력받는 데이터가 1,00,000개이다. 즉 데이터가 많으면 nLog^n 시간이 걸리는 이분탐색을 사용한다!

class Baekjoon_12015 {


    func solution(_ x: Int, arr: [Int]) -> Int {
        
        var list = [arr[0]]
        
        for i in 1..<x {
            if list.last! < arr[i] { //최대값이라 추가
                list.append(arr[i])
            } else { // 대치(교환) 및 이분탐색
                
                // 방법 1
                //list[binarySearch(arr[i], 0, list.count)] = arr[i]
                
                // 방법 2
                let index = getLowerBound(arr[i], containList: list)
                //print("list: \(list) @ index: \(index) @@ \(arr[i])")
                list[index] = arr[i]
            }
        }
        
        
        // 내가 쓴 방식 : 재귀함수
        func binarySearch(_ target: Int, _ start: Int, _ end: Int) -> Int {
            let mid = (start + end) / 2
            
            if start > end {
                return start
            }
            
            if list[mid] == target {
                //print("list: \(list) - mid: \(mid)  ---- target: \(target)")
                return mid
            } else if list[mid] > target {
                return binarySearch(target, start, mid-1)
            } else {
                return binarySearch(target, mid+1, end)
            }
        }
        
        // 다른 사람 방식 : while문 사용하여 이분탐색 구현 => 시간 더 빠름
        func getLowerBound(_ find: Int, containList: [Int]) -> Int {
            var left = 0
            var right = containList.count - 1
            var mid = 0
            
            while left < right {
                mid = (left + right) / 2
                
                if containList[mid] < find {
                    left = mid + 1
                } else {
                    right = mid
                }
            }
            return right
        }
        //print("list: \(list)")
        return list.count
    }
    
    
    func call() {
        //let x = ReadLine().getInt()
        //let s = ReadLine().getArrInt()
        //
        //print(solution(x, arr: s))


        //solution(6, arr: [10, 20, 10, 30, 20, 50]) // [10, 20, 30, 50] => 4

        //solution(9, arr: [10, 20, 10, 15, 18, 20, 70, 50, 60]) // [10, 15, 18, 20, 50, 60] => 6

        let s1 = solution(10, arr: [10, 20, 30, 15, 20, 30, 50, 40, 45 ,60]) // [10, 15, 20, 30, 40, 45, 60] => 7
        print(s1)
    }


}
