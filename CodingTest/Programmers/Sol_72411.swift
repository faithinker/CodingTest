//
//  Sol_72411.swift
//  CodingTest
//
//  Created by jhKim on 2022/06/14.
//

import Foundation

/// [프로그래머스 72411] 메뉴 리뉴얼(https://programmers.co.kr/learn/courses/30/lessons/72411)
class Sol_72411 {
    
    init() {
        
        let s1 = solution(["ABCFG", "AC", "CDE", "ACDE", "BCFG", "ACDEH"], [2,3,4])
        let s2 = solution(["ABCDE", "AB", "CD", "ADE", "XYZ", "XYZ", "ACD"], [2,3,5])
        let s3 = solution(["XYZ", "XWY", "WXA"], [2,3,4])
        
        print("s1: \(s1) s2: \(s2) s3: \(s3)")
        // ["AC", "ACDE", "BCFG", "CDE"]
    }
    
    
    func solution(_ orders:[String], _ course:[Int]) -> [String] {
        
        var result = [String]()
        
        for course in course {
            //print("course: \(course)")
            
            var dicCount = [String:Int]()
            
            for i in 0..<orders.count {
                let data = orders[i].map { String($0) }.sorted()
                
                //print("data: \(data)")
                
                let datas = combi(data, course)
                
                //print("datas: \(datas)")
                
                datas.forEach {
                    if let value = dicCount[$0] {
                        dicCount.updateValue(value + 1, forKey: $0)
                    } else {
                        dicCount[$0] = 1
                    }
                }
            }
            
            var tempResult = [String]()
            var tempMax = 2
            
            //print("dicCount: \(dicCount)")
            
            dicCount.forEach { key, value in
                
                if tempMax < value {
                    tempResult.removeAll()
                    tempResult.append(key)
                    tempMax = value
                } else if tempMax == value {
                    tempResult.append(key)
                }
            }
            
            //print("tempResult: \(tempResult)")
            
            tempResult.forEach {
                result.append($0)
            }
            
        }
        
        //print("result: \(result)")
        
        result.sort()
        
        return result
    }
    
    
    func combi(_ nums: [String], _ targetNum: Int) -> [String] {
        var result = [String]()

        func combination(_ index: Int, _ nowCombi: String) {
            if nowCombi.count == targetNum {
                result.append(nowCombi)
                return
            }
            for i in index..<nums.count {
                combination(i + 1, nowCombi + nums[i])
            }
        }

        combination(0, "")

        return result
    }
    
    
    // MARK: - 다른 사람 풀이
    func solution2(_ orders:[String], _ course:[Int]) -> [String] {
        var set = [String: Int]()

        func dfs(index: Int, origin: [Character], newString: String) {
            // 주어진 최대 길이보다 현재 문자열길이가 길면 검사할필요 x
            if course.last! < newString.count {
                return
            }
            // 주어진 길이에 해당하는 코스길이가 있으면 갯수추가
            if course.contains(newString.count) {
                if set.keys.contains(newString) {
                    set[newString]! += 1
                } else {
                    set[newString] = 1
                }
            }
            // 현재인덱스 뒤부터 접근
            for i in index..<origin.count {
                let c = origin[i]
                dfs(index: i + 1, origin: origin, newString:  "\(newString)\(c)")
            }
        }
        // 탐색시작
        for order in orders {
            let order = order.sorted()
            dfs(index: 0, origin: order, newString: "")
        }

        // 조합중 2번이상 선택받은 메뉴만 가능
        // 최대값이 같으면 모두포함
        var result = [String]()
        for length in course {
            let temp = set.filter { $0.key.count == length && $0.value > 1 }
            let maxNum = temp.max { $0.value < $1.value }
            let menu = temp.filter { maxNum!.value == $0.value }.map { $0.key }
            result.append(contentsOf: menu)
        }

        return result.sorted()
    }
}
