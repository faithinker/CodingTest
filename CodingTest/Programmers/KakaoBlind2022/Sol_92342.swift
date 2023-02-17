//
//  Sol_92342.swift
//  CodingTest
//
//  Created by jhkim on 2022/12/07.
//

import Foundation

// [프로그래머스 92342] 양궁대회 https://school.programmers.co.kr/learn/courses/30/lessons/92342

// 무슨 기법을 써야할 것 같은데 정확하게 멀 써야할지를 몰랐다...
// DFS/BFS 문제풀이가 더 필요하다!!

/*
 라이언이 10점 획득 X
        9점 획득 O     9점 획득 X
 라이언이 10점 획득 O
        9점 획득 O     9점 획득 X
 
 갈라치기 분기하여 문제풀기...
 
 DFS + 탐색 + 그리디
 https://youtu.be/_kZiCr5xtKk
 */

/* 예외처리 조건
 라이언이 어피치보다 더 높은 점수를 획득하는 후보
 동일한 점수 차 중 가장 낮은 점수를 더 많이 가진 경우
 만족하는 조건이 없거나 어피치가 우수하다면 [-1]로 리턴
 */

class Sol_92342 {
    
    var diff = 0
    var result = [Int]()
    
    init() {
        // diff와 result가 전역변수이기 때문에 호출시마다 갱신 시켜야 한다!!
        let t1 = solution(5, [2,1,1,1,0,0,0,0,0,0,0]) // [0,2,2,0,1,0,0,0,0,0,0]
        diff = 0; result = []
        let t2 = solution(1, [1,0,0,0,0,0,0,0,0,0,0]) // [-1]
        diff = 0; result = []
        let t3 = solution(9, [0,0,1,2,0,1,1,1,1,1,1]) // [1,1,2,0,1,2,2,0,0,0,0]
        diff = 0; result = []
        let t4 = solution(10, [0,0,0,0,0,0,0,0,3,4,3]) // [1,1,1,1,1,1,1,1,0,0,2]

    }
    
    func solution(_ n:Int, _ info:[Int]) -> [Int] {
        let lionInfo = Array(repeating: 0, count: 11)
        
        dfs(n, 10, info, lionInfo)

        return result.isEmpty ? [-1] : result
    }

    func compare(_ origin: [Int], _ new: [Int]) -> Bool {
        for idx in stride(from: 10, through: 0, by: -1) {
            if origin[idx] > new[idx] {
                return false
            } else if origin[idx] < new[idx] {
                return true
            }
        }
        return false
    }

    /// - n 남은 화살 갯수
    /// - score 최종 점수 (순회하는 index)
    /// - info 어피치의 점수 정보 => 고정값이라 굳이 인수 받을 필요는 없다.
    /// - lion 라이언의 점수 획득판
    func dfs(_ n: Int, _ score: Int, _ info:[Int], _ lion: [Int]) {
        var lionInfo = lion
        
        if n == 0 || score == 0 { // 남은 화살이 없거나 더이상 획득할 점수가 없을 경우, DFS를 종료하고 최종 점수를 반환
            if score == 0 { // 화살(n)이 남아있으면 마지막에 화살 전부 꽂는다.
                lionInfo[10] = n
            }
            var totalA = 0, totalL = 0
            
            for i in 0..<11 {
                if info[i] == 0 && lionInfo[i] == 0 { continue } //
                if info[i] >= lionInfo[i] && info[i] != 0 { // 총합 점수 계산
                    totalA += (10 - i)
                } else { // 라이언 총합점수 계산
                    totalL += (10 - i)
                }
            }
            if totalL > totalA { // 라이언이 어피치보다 점수가 높다면 후보
                if diff < (totalL - totalA)  { // 지금것이 기존것보다 더 점수차이가 크다면 결과값 갱신
                    result = lionInfo
                    diff = (totalL - totalA)
                } else if diff == (totalL - totalA) && compare(result, lion) {
                    // 지금 점수가 기존과 동일하고 가장 낮은 점수를 가졌다면 결과값 갱신
                    result = lionInfo
                }
            }
            return
        }
        // 계속 DFS를 수행한다.
        var idx = 10 - score
        
        if n > info[idx] { // 해당 스코어를 라이언이 획득하는 경우
            var temp = lion
            temp[idx] = info[idx] + 1
            dfs(n - info[idx] - 1, score - 1, info, temp)
        }
        
        // 해당 스코어를 라이언이 획득하지 않는 경우
        var temp = lion
        dfs(n, score - 1, info, temp)
    }

}
