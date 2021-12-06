//
//  Sol_81302.swift
//  CodingTest
//
//  Created by pineone on 2021/12/06.
//

import Foundation

// 실패
// [프로그래머스 81302] 거리두기 확인하기(https://programmers.co.kr/learn/courses/30/lessons/81302)

//let world:[String] = ["지구","한국","미국","영국","서울","부산","광주","뉴욕","LA","시카고","런던","맨체스터","리버풀"]
//let n:Int = 13
//let allConnections:[[Int]] = [[0,1],[2,0],[0,3],[4,1],[5,1],[1,6],[2,7],[2,8],[9,2],[3,10],[3,11],[12,3]]
//// all[0] < all[1]
//var connections:[[Bool]] = Array(repeating: Array(repeating: false, count: n), count: n)
//var parentChildren:[[String]] = Array(repeating: [], count: n)
//
//func setConnections() {
//    for connection in allConnections {
//        let left:Int = connection[0]
//        let right:Int = connection[1]
//        connections[left][right] = true
//        connections[right][left] = true
//    }
//}
//
//func searchByDFS(parent:Int,current:Int) {
//    connections[current]
//        .enumerated()
//        .filter{$0.element == true && $0.offset != parent}
//        .forEach {
//            parentChildren[current].append(world[$0.offset])
//            searchByDFS(parent: current, current: $0.offset)
//        }
//}
//
//setConnections()
//searchByDFS(parent: 0, current: 0)
//print(parentChildren)
//for (i,children) in parentChildren.enumerated(){
//    print("\(world[i])의 자식은 \(children)")
//}

//let allConnections:[[Int]] = [
//    [0,1],
//    [2,0],
//    [0,3],
//    [4,1],
//    [5,1],
//    [1,6],
//    [3,7],
//    [3,8],
//    [9,3],
//    [2,10],
//    [2,11],
//    [12,2]
//]


/*
[["한국", "미국", "영국"], ["서울", "부산", "광주"], ["뉴욕", "LA", "시카고"], ["런던", "맨체스터", "리버풀"], [], [], [], [], [], [], [], [], []]
지구의 자식은 ["한국", "미국", "영국"]
한국의 자식은 ["서울", "부산", "광주"]
미국의 자식은 ["뉴욕", "LA", "시카고"]
영국의 자식은 ["런던", "맨체스터", "리버풀"]
서울의 자식은 []
부산의 자식은 []
광주의 자식은 []
뉴욕의 자식은 []
LA의 자식은 []
시카고의 자식은 []
런던의 자식은 []
맨체스터의 자식은 []
리버풀의 자식은 []
*/
