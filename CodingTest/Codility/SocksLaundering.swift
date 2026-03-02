//
//  SocksLaundering.swift
//  CodingTest
//
//  Created by jhkim on 2026.03.02.
//

import Foundation

/// [SocksLaundering](https://app.codility.com/programmers/trainings/3/)
/// 1순위: 깨끗한 양말끼리 쌍 만들기
/// 2순위: 깨끗한 홀수 1개 + 더러운 같은 색 1개 (용량 체크 및 1 소모)
/// 3순위: 더러운 양말 같은 색 2개 (용량 체크 및 2 소모)
class SocksLaundering {
    
    public func solution(_ K : Int, _ C : inout [Int], _ D : inout [Int]) -> Int {
        
        var cleanDict: [Int: Int] = [:]
        var durtyDict: [Int: Int] = [:]
        var count = K  // 세탁기 용량 채우기
        var result = 0 // 깨끗한 짝 결과
        
        for c in C {
            cleanDict[c, default: 0] += 1
            
            // 꺠끗한 짝 있으면 쌍 제거후 결과 업
            if cleanDict[c] == 2 {
                cleanDict[c]! -= 2
                result += 1
                
                if cleanDict[c] == 0 {
                    cleanDict.removeValue(forKey: c)
                }
            }
        }
        
        for d in D {
            durtyDict[d, default: 0] += 1
        }
        
        //print("count: \(count), result: \(result), cleanDict: \(cleanDict), durtyDict: \(durtyDict)")
        
        
        cleanDict.forEach { // 깨끗한것은 홀수개밖에 없음
            if count == 0 { return }
            
            if let _ = durtyDict[$0.key] {
                cleanDict[$0.key]! -= 1
                durtyDict[$0.key]! -= 1
                
                if cleanDict[$0.key]! == 0 {
                    cleanDict.removeValue(forKey: $0.key)
                }
                if durtyDict[$0.key]! == 0 {
                    durtyDict.removeValue(forKey: $0.key)
                }
                result += 1
                count -= 1
            }
        }
        
        //print("count: \(count), result: \(result), cleanDict: \(cleanDict), durtyDict: \(durtyDict)")
        
        // 세탁기 용량이 2 이상이고 더러운것 중에서 2개 배수 짝이 있으면
        // 더러운것 짝 제거 후 세탁기 용량도 2씩 제거 둘중 하나라도 1 이하 될때까지 반복
        
        var pairDurty = durtyDict.filter{ $0.value > 1 }
        
        while count > 1 && pairDurty.count > 0 {
            if let firstDurty = pairDurty.filter({ $0.value > 1 }).first {
                
                pairDurty[firstDurty.key]! -= 2
                count -= 2
                result += 1
                if pairDurty[firstDurty.key]! < 2 {
                    pairDurty.removeValue(forKey: firstDurty.key)
                }
            } else {
                break
            }
        }

        //print("count: \(count), result: \(result), cleanDict: \(cleanDict), durtyDict: \(durtyDict)")
        
        return result
    }

    var K = 2 // 세탁기 용량
    var C = [1, 2, 1, 1] // 깨끗한 양말
    var D = [1, 4, 3, 2, 4] // 더러운 양말

    //print(solution(K, &C, &D)) // 3

    //K = 4; C = [5]; D = [1, 1, 1]

    //print(solution(K, &C, &D)) // 1

//    K = 2; C = [1, 1, 2, 2]; D = [1]
//    print(solution(K, &C, &D)) // 2

    
    // ai 답변
    public func solution1(_ K: Int, _ C: inout [Int], _ D: inout [Int]) -> Int {
        var clean = [Int: Int]()  // 깨끗한 양말 색상별 개수
        var dirty = [Int: Int]()  // 더러운 양말 색상별 개수
        var pairs = 0
        var washes = K
        
        // 색상별 개수 세기
        for c in C { clean[c, default: 0] += 1 }
        for d in D { dirty[d, default: 0] += 1 }
        
        // 1순위: 깨끗한 양말끼리 쌍 (공짜)
        for (color, count) in clean {
            pairs += count / 2
            clean[color] = count % 2  // 홀수면 1 남음
        }
        
        // 2순위: 깨끗한 1개 + 더러운 1개 (세탁 1개 소모)
        for (color, count) in clean {
            if count == 1 && washes > 0 && (dirty[color] ?? 0) > 0 {
                pairs += 1
                washes -= 1
                dirty[color]! -= 1
            }
        }
        
        // 3순위: 더러운 2개끼리 쌍 (세탁 2개 소모)
        // 한 색상을 한 번에 계산 → O(1)
        for (_, count) in dirty {
            let possible = min(count / 2, washes / 2)
            pairs += possible
            washes -= possible * 2
        }
        
        return pairs
    }

}
