//
//  main.swift
//  CodingTest
//
//  Created by JoohyupKim on 2021/09/13.
//
// 그동안 푼 알고리즘 네이버 블로그에 업로드 한 기록 :
// https://blog.naver.com/rlawnguq12/222499589480
// [프로그래머스 문제번호] 제목(링크)
//
// 문제 기록 방법
// 1. 파일 만들기 (파일명: _문제번호)
// 2. 파일에 클래스 -> Sol 함수 -> init 호출 작성
// 3. main 파일에서 호출하기 클래스명.init() 또는 클래스명().self
// * 코드만 쓰지 말고 나의 사고과정, 추론이유, 남의 풀이법 비교해서 주석 설명하기!!!
// ** README 작성하기!!
//
// LeetCode 기록 작성법
// 함수이름 또는 url을 파일명으로 만들기
// 함수 이름 위에 주석으로 문제명, 문제url 달기

import Foundation

//var log: [Any] = [Test.init(), Sol_86491().self]

//_ = Sol_86491(); _ = Sol_86051()

// MARK: - LeetCode
//print(Palindrome_number().isPalindrome(1000021))
//print(Two_Sum().twoSum([2,7,11,15], 9) // OUTPUT: [0,1]

// MARK: - 프로그래머스
//print(Sol_12973().solution("baabaa"))
//print(Sol_12911().solution(78)) // result 83

// MARK: 백준
// print(Baekjoon_5585())
// 런해서 예시 입력값을 cmd창에서 직접 입력해야함
// 백준은 함수명, 입력값과 출력값 모두 작성해줘야 한다.

/*
 Swift ReadLine https://didu-story.tistory.com/177
 추후에 자주쓰는 extension 따로 파일로 만들어서 호출하자!!
 
 팁 : 여러줄 출력할때 String으로 합친다음
 var result = "\(Value)\n"
 result.removeLast() 해주는게 좋다!
 */

/// 알고리즘 출처 : https://github.com/raywenderlich/swift-algorithm-club/tree/master/Heap

/// 브루트포스 알고리즘 brute force
/// [백준 1065][실버4] 한수(https://www.acmicpc.net/problem/1065)
/// [백준 14501][실버3] 퇴사(https://www.acmicpc.net/problem/14501)
/// [백준 1018][실버5] 체스판 다시 칠하기(https://www.acmicpc.net/problem/1018)

// [프로그래머스 43165] 타겟넘버 https://school.programmers.co.kr/learn/courses/30/lessons/43165 - 깊이/너비 우선 탐색(DFS/BFS)

/// [백준 16236][골드3] 아기 상어(https://www.acmicpc.net/problem/16236)

/// [백준 2146][골드3] 다리 만들기(https://www.acmicpc.net/problem/2146)
/// 1. 섬 군락을 찾는다. => BFS
/// 2. 섬(바다 인접부분)과 섬사이의 모든 거리를 연결한다. => BFS 사용. 엣지 4개만 체크?
/// ===> 다리 시작점 다리를 1개씩 놓으면서 상하좌우 다른 섬이 연결 가능한지 체크... 안되면 다음 다리 놓기
/// 3. BFS의 최솟값을 찾는다.

func solution(_ n: Int, _ arr: [[Int]]) {
    
    var graph = arr
    let dx = [0, 0, 1, -1], dy = [1, -1, 0, 0]
    
    var islands = [[(Int, Int)]]()
    
    
    
    func bfs(_ x: Int, _ y: Int) {
        var area = [(x, y)]
        var queue = [(x, y)]
        graph[x][y] = 0
        
        
        while !queue.isEmpty {
            let temp = queue.removeFirst()
            
            for i in 0..<4 {
                let nx = temp.0 + dx[i], ny = temp.1 + dy[i] // 상하좌우 좌표
                // 2차원 배열 안에 들어있고, 해당 집이 있는 경우에만 방문 처리 및 카운트 증가 처리
                if (nx < 0 || nx >= n || ny < 0 || ny >= n) == false && graph[nx][ny] == 1 {
                    graph[nx][ny] = 0
                    area.append((nx, ny))
                    queue.append((nx, ny))
                }
            }
        }
        islands.append(area)
    }
    
    // 최단거리 = |x2-x1| + |y2-y1| - 1
    // https://astrid-dm.tistory.com/m/362
    var result = Int.max
    
    
    
    
    for i in 0..<n {
        for j in 0..<n {
            if graph[i][j] == 1 {
                bfs(i, j)
                //showMatrix(graph)
            }
        }
    }
    
    showMatrix(islands)
    
}


func showMatrix<T>(_ array: [[T]]) {
    for v in array {
        print(v)
    }
    print("===========================")
}

//var input = ReadLine().getInt()
//var mat = [[Int]]()
//
//for _ in 0..<input {
//    mat.append(ReadLine().getArrInt())
//}
//
//solution(mat)

//for v in mat {
//    print("\(v),")
//}

var mat2 = [[1, 1, 1, 0, 0, 0, 0, 1, 1, 1],
            [1, 1, 1, 1, 0, 0, 0, 0, 1, 1],
            [1, 0, 1, 1, 0, 0, 0, 0, 1, 1],
            [0, 0, 1, 1, 1, 0, 0, 0, 0, 1],
            [0, 0, 0, 1, 0, 0, 0, 0, 0, 1],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 1, 1, 0, 0, 0, 0],
            [0, 0, 0, 0, 1, 1, 1, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]]

solution(10, mat2)



