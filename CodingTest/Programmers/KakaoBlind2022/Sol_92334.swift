//
//  Sol_92334.swift
//  CodingTest
//
//  Created by jhKim on 2022/05/09.
//

import Foundation

/// [프로그래머스 92334] 신고 결과 받기(https://programmers.co.kr/learn/courses/30/lessons/92334)
class Sol_92334 {
    
    // 내풀이
    func solution_1(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
        
        // 사람:인덱스
        var idIndex = [String:Int]()
        
        // 신고당한사람 : (중복제거)신고한사람들
        var reportInfo:[String:Set<String>] = [:]
        
        id_list.enumerated().forEach {
            idIndex[$0.element] = $0.offset
            reportInfo[$0.element] = []
        }
        
        report.forEach {
            let split = $0.split(separator: " ").map { String($0) }
            reportInfo[split[1]]!.insert(split[0])
        }
        
        //print("reportInfo: \(reportInfo)")
        
        var result = Array(repeating: 0, count: id_list.count)
        
        reportInfo.forEach {
            if $0.value.count >= k { //신고횟수가 넘었으면..
                $0.value.forEach {  // 신고한사람한테 결과 메일이 오는 횟수 증가
                    result[idIndex[$0]!] += 1
                }
            }
        }
        
        //print("result: \(result)")
        
        return result
    }
    
    // 다른 사람 풀이
    func solution_2(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
        var reported: [String: Int] = [:]
        var user: [String: [String]] = [:]

        for r in Set(report) {
            let splited = r.split(separator: " ").map { String($0) }
            user[splited[0]] = (user[splited[0]] ?? []) + [splited[1]]
            reported[splited[1]] = (reported[splited[1]] ?? 0) + 1
        }
        
        let result = id_list.map { id in
            return (user[id] ?? []).reduce(0) {
                $0 + ((reported[$1] ?? 0) >= k ? 1 : 0)
            }
        }
        
        return result
    }
    
    // Input 값
    func printSol(_ caseNum: Int = 0) {
        if caseNum == 0 {
            solution_1(["muzi", "frodo", "apeach", "neo"], ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"], 2)
        } else {
            solution_1(["con", "ryan"], ["ryan con", "ryan con", "ryan con", "ryan con"], 3)
        }
    }
    
    // 처음 생각한 풀이... 시간초과로 케이스 두개 실패
    func solution_3(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    
        // 사람 : 신고당한 횟수
        var count = [String:Int]()
    
        // 유저ID : 신고ID, 정지된ID 갯수
        var info = [String : ([String], Int)]()
    
        // 중복 신고 1회처리
        var filterdReport: Set<String> = []
    
        // 정지된 ID
        var blockID = [String]()
    
        var result = [Int]()
    
        report.forEach {
            filterdReport.insert($0)
        }
    
        //print("filterd : \(filterdReport)")
    
    
        id_list.forEach {
            count.updateValue(0, forKey: $0)
            info.updateValue(([], 0), forKey: $0)
        }
    
        filterdReport.forEach {
            let id = $0.split(separator: " ").map {
                return String($0)
            }
    
            count[id[1]]! += 1 // 신고당한횟수 카운팅
            info[id[0]]!.0.append(id[1]) // 신고한 ID와 유저가 신고한 사람의 목록만 담김
        }
    
        //print("Count @@ \(count)")
    
        count.forEach { key, value in
            if value >= k {
                blockID.append(key)
            }
        }
    
        //print("blockID : \(blockID)")
    
        //print("Info @@ \(info)")
    
        // 결과 메일 받게되는 횟수(결과값)를 업데이트함
        info.forEach { key, value in
            blockID.forEach {
                if value.0.contains($0) {
                    info[key]?.1 += 1
                }
            }
        }
    
        id_list.forEach { //info는 닥셔너리라 순서가 정해져있지 않아 id_list를 통해 순서 확보!
            result.append(info[$0]!.1)
        }
    
        print(result)
    
        return result
    }
}









