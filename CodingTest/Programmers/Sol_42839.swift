//
//  Sol_42839.swift
//  CodingTest
//
//  Created by pineone on 2022/05/27.
//

import Foundation

/// 1. 숫자를 조합하여 만들 수 있는 모든 숫자를 배열에 담는다.
/// 2. target이 소수인지 판별한다. 2, 3, 5, 7, 11, 13, 17, 19...
/// for문을 덜 돌기 위해서는 11이상인 수는 2의배수, 5의 배수가 아닌것을 제외하고 체크한다!

/// 내가 해결하지 못한것! 완전탐색
/// 과연 실전에서 2~3중 for문을 쓰지 않고 재귀, BFS, DFS 등을 쓸 수 있을까? 위 기술을 못쓰면 직접 For문을 돌려햐 한다!!
// 1, 2, 6, 9, 10

/// 프로그래머스 42839 소수 찾기 https://programmers.co.kr/learn/courses/30/lessons/42839
class Sol_42839 {
    
    init() {
        //print(solution("17"))
        //print(solution("011"))

        print(solution("1231"))
    }
    
    
    func solution2(_ numbers:String) -> Int {
        
        let data = numbers.map { String($0) }
        
        var visit = [Bool](repeating: false, count: data.count)

        var result = [Int]()
        
        var uniqueData = Set<Int>()
        
        let oneArr = [2, 3, 5, 7]
        
        func dfs(data: [String], curInd: Int, curCnt: Int, answer: String) {
            if let num = Int(answer) {
                switch num {
                case 2..<10 :
                    if oneArr.contains(num) {
                        result.append(num)
                    }
                case 11... :
                    //print("num: \(num) \(!num.isMultiple(of: 2)) \(!num.isMultiple(of: 5)) ")
                    if !num.isMultiple(of: 2) && !num.isMultiple(of: 5) {
                        for i in 2...num {
                            if num%i != 0 && i == num-1 {
                                result.append(num)
                            } else if num%i == 0 {
                                break
                            }
                        }
                    }
                default:
                    break
                }
            }
            
            for i in 0..<data.count {
                if !visit[i] {
                    visit[i] = true
                    dfs(data: data, curInd: i, curCnt: curCnt + 1, answer: answer + data[i])
                    visit[i] = false
                }
            }
        }
        
        dfs(data: data, curInd: 0, curCnt: 0, answer: "")
        
        uniqueData = Set(result)
        
        //print(uniqueData.sorted(by: <))
        
        return uniqueData.count
    }
    
    
    
    /// 처음 생각한 답!!!!
    func solution(_ numbers:String) -> Int {

        let data = numbers.map { String($0) }

        var visit = [Bool](repeating: false, count: data.count)

        var result = [Int]()

        var uniqueData = Set<Int>()
        
        let oneArr = [2, 3, 5, 7]

        func dfs(data: [String], curInd: Int, curCnt: Int, answer: String) {

            if let num = Int(answer) {
                if num<10 {
                    if oneArr.contains(num) {
                        result.append(num)
                    }
                } else if num > 2 {
                    for i in 2...num {
                        if num%i != 0 && i == num-1 {
                            result.append(num)
                        } else if num%i == 0 {
                            break
                        }
                    }
                }
            }

            for i in 0..<data.count {
                if !visit[i] {
                    visit[i] = true
                    dfs(data: data, curInd: i, curCnt: curCnt + 1, answer: answer + data[i])
                    visit[i] = false
                }
            }
        }

        dfs(data: data, curInd: 0, curCnt: 0, answer: "")


        uniqueData = Set(result)

        //print(uniqueData.sorted(by: <))

        return uniqueData.count
    }
}


//입력값 = "1231"
//결과 = 18
//[2, 3, 11, 13, 23, 31, 113, 131, 211, 311, 1123, 1213, 1231, 1321, 2113, 2131, 2311, 3121]


/// 두번째 부분 적으로 for문 내부를 덜 돌기!! 홀수만 돌게한다!!! => 조건문 검색이 많아서 속도가 안빠르다!!!! 그냥 처음부터 for문 더 도는게 낫다!!!
//func dfs(data: [String], curInd: Int, curCnt: Int, answer: String) {
//    if let num = Int(answer) {
//        switch num {
//        case 2:
//            result.append(num)
//        case 3..<10 :
//            for i in 2..<num {
//                if num%i != 0 && i == num-1 {
//                    result.append(num)
//                } else if num%i == 0 {
//                    break
//                }
//            }
//        case 11... :
//            //print("num: \(num) \(!num.isMultiple(of: 2)) \(!num.isMultiple(of: 5)) ")
//            if !num.isMultiple(of: 2) && !num.isMultiple(of: 5) {
//                for i in stride(from: 1, to: num/2, by: 2) {
//                    let k = i+2
//                    //print("k: \(k) i: \(i), num: \(num), \(num%k != 0) \(k == num-1)")
//                    if num%k != 0 && k*2-1 == num || num%k != 0 && k*2+1 == num  {
//                        result.append(num)
//                    } else if num%k == 0 {
//                        break
//                    }
//                }
//            }
//        default:
//            break
//        }
//    }
//
//    for i in 0..<data.count {
//        if !visit[i] {
//            visit[i] = true
//            dfs(data: data, curInd: i, curCnt: curCnt + 1, answer: answer + data[i])
//            visit[i] = false
//        }
//    }
//}


//func solution(_ numbers:String) -> Int {
//
//    let data = numbers.map { String($0) }
//
//    var visit = [Bool](repeating: false, count: data.count)
//
//    var result = [Int]()
//
//    var uniqueData = Set<Int>()
//
//    func dfs(data: [String], curInd: Int, curCnt: Int, answer: String) {
//
//        if let num = Int(answer) {
//            if num == 2 {
//                result.append(num)
//            } else if num > 2 {
//                for i in 2...num {
//                    if num%i != 0 && i == num-1 {
//                        result.append(num)
//                    } else if num%i == 0 {
//                        break
//                    }
//                }
//            }
//        }
//
//        for i in 0..<data.count {
//            if !visit[i] {
//                visit[i] = true
//                dfs(data: data, curInd: i, curCnt: curCnt + 1, answer: answer + data[i])
//                visit[i] = false
//            }
//        }
//    }
//
//    dfs(data: data, curInd: 0, curCnt: 0, answer: "")
//
//
//    uniqueData = Set(result)
//
//    //print(uniqueData.sorted(by: <))
//
//    return uniqueData.count
//}
