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
 
 백준 예제값 복사한다음 붙여넣기 하기! 굳이 일일히 키보드 입력 안해줘도 된다.
 */

/// 알고리즘 출처 : https://github.com/raywenderlich/swift-algorithm-club/tree/master/Heap

/// 브루트포스 알고리즘 brute force
/// [백준 1065][실버4] 한수(https://www.acmicpc.net/problem/1065)
/// [백준 14501][실버3] 퇴사(https://www.acmicpc.net/problem/14501)
/// [백준 1018][실버5] 체스판 다시 칠하기(https://www.acmicpc.net/problem/1018)
/// [프로그래머스 43165] 타겟넘버 https://school.programmers.co.kr/learn/courses/30/lessons/43165 - 깊이/너비 우선 탐색(DFS/BFS)
/// [백준 16236][골드3] 아기 상어(https://www.acmicpc.net/problem/16236)
/// => 구간합(누적합), 위상정렬 문제풀이

/// 부분 누적합!!!
/// [백준 3020][골드5] 개똥벌레(https://www.acmicpc.net/problem/3020)
/// Baekjoon_3020

/// 중요 수칙사항!!
/// 앞으로 ReadLine과 같은 특정 클래스를 만들지 않는다.
/// 코딩테스트 시험을 볼 때 외부 자료를 못보게 하거나 아예 IDE도 쓰지 못하게 한다.
/// 휴대폰과 노트북을 사용하여 캠으로 녹화를 한다. 그리고 모니터 화면도 한개만 쓰게 한다.
/// 따라서 앞으로는 웹브라우져 IDE에서 연습하고 답안 및 풀이만 여기서 적도록 한다.



//let t = "안녕하세요.".replacingOccurrences(of: ".", with: "!")
//print(t)


