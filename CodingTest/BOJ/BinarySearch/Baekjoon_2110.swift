//
//  Baekjoon_2110.swift
//  CodingTest
//
//  Created by jhkim on 2022/11/15.
//

import Foundation


/// 출처 : https://sapjilkingios.tistory.com/entry/Swift이분-탐색-백준-2110번-공유기-설치
/// [백준 2110][골드4] 공유기 설치(https://www.acmicpc.net/problem/2110)

/*
 목표 : 두 공유기 사이의 거리를 최대로 하는 프로그램을 작성
 
 전제조건 : 공유기 2개이상, 집 두개이상
 
 1. 집 거리순으로 정렬한다.
 2. 처음에 공유기를 무조건 놓는다.
 3. (처음과 끝집의 거리의 차)/2 한 값을 가운데(m) 값으로 기준을 잡는다.
 4. 가운데 값보다 크거나 같다면 공유기를 놓고 공유기를 증가시킨다.
 5. 처음 ~ m-1, m+1 ~ 끝 각 두개의 거리 가운데에 대소 비교를 하여 큰쪽에 놓는다.
 
 https://www.youtube.com/watch?v=Wbhwlf4stfY
 */

class Baekjoon_2110 {
    
    //let cn = ReadLine().getArrInt()
    //let c = cn[1]
    //let arr = ReadLine().multipleNewLine(num: cn[0])
    
    let c = 3
    var arr = [1, 2, 8, 4, 9]
    
    init() {
        print(binarySearch(arr: arr))
    }

    func binarySearch(arr: [Int]) -> Int {
        let newArr = arr.sorted()
        
        var start = 1, end = newArr[newArr.count - 1] - newArr[0]
        
        while start <= end {
            var count = 1
            var prevHouse = newArr[0]
            let mid = (start + end) / 2
            
            for i in 1..<arr.count {
                if newArr[i] - prevHouse >= mid { // 기준 거리값 이상이라면 공유기 설치
                    count += 1
                    prevHouse = newArr[i]
                }
            }
            
            if count < c { // 공유기가 덜 놓였다면 거리가 너무 크기 때문에 끝값을 조정한다.
                end = mid - 1
            } else {
                start = mid + 1
            }
        }
        return end
    }
}
