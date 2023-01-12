//
//  Fibonacci.swift
//  CodingTest
//
//  Created by jhkim on 2023/01/06.
//

import Foundation

/* 다이나믹 프로그매이 = 동적 계획법
 일반적인 동적의 의미
 동적할당 : 프로그램이 실행되는 도중에 실행에 필요한 메모리를 할당하는 기법
 다이나믹 프로그래밍 : 의미 없음
 
 최적 부분 구조 Optimal Substructure : 큰 문제를 작은 문제로 나눌 수 있으며 작은 문제의 답을 모아서 큰 문제를 해결
 중복되는 부분 문제 : 동일한 작은 문제를 반복적으로 해결
 
 피보나치 수열, 점화식 : 인접한 항들 사이의 관계식
 
 재귀적으로 호출되는 부분과 종료조건을 파악한다.
 
 이미 해결한적 있는 문제는 알려줄 수 있도록 별도의 메모리 공간에 이미 해결한 문제를 기록해야 한다.
 
 탑다운(하향식) 메모제이션 Memoization : 한 번 계산한 결과를 메모리 공간에 메모
  => 값을 기록한다는 점에서 캐싱(Caching) 배열이름 : cache, memo, table, dp, d 이라고 많이 쓴다.
 메모이제이션 : 이전에 계산된 결과를 일시적으로 기록해 놓는 넓은 개념
 
 
 보텀업(상향식) : for문으로 구현 작은것에서 -> 큰것을 구한다.
 
 각 부분 문제들이 서로 영향을 미치며 부분 문제가 중복된다.
 
 
 */


class Fibonacci {
    
    
    func call() {
        print(topDownFibo(6))
        
//        print(bottomUpFibo(50))
    }

    // 기본형
    func fibo(_ x: Int) -> Int {
        if x == 1 || x == 2 {
            return 1
        }
        
        return fibo(x - 1) + fibo(x - 2)
    }

    var d = Array(repeating: 0, count: 200)
    
    // 위에서 아래로..
    func topDownFibo(_ x: Int) -> Int {
        Swift.print("f(\(x)) ")
        
        if x == 1 || x == 2 {
            return 1
        }
        
        if d[x] != 0 {
            return d[x]
        }
        
        d[x] = topDownFibo(x - 1) + topDownFibo(x - 2)
        
        return d[x]
    }

    


    // 작은 문제부터 먼저 해결한 다음에, 먼저 해결해 놓았던 작은 문제들을 조합해서 앞으로의 큰 문제들을 차례대로 구해나갈 수 있다.
    func bottomUpFibo(_ n: Int) -> Int {
        var dp = Array(repeating: 0, count: 200)

        dp[1] = 1
        dp[2] = 1

        for i in 3..<n+1 {
            dp[i] = dp[i-1] + dp[i-2]
        }
        
        return dp[n]
    }

    

}
