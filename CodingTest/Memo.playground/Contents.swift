/// 자주쓰는 함수, 알고있으면 유용한 것 정리

import Cocoa

let zeroes = repeatElement(0, count: 5)

var min: Int = Int.min

/// 진수 변환
/// 10진수 -> 2진수
let decimal: Int = 30
let binary: String = String(decimal, radix: 2)
print(binary) /* 11110 */


/// 2진수 -> 10진수
let binary2: String = "11011"
let decimal2: Int = Int(binary2, radix: 2)!
print(decimal2) /* 27 */


abs(5) // 절대값
1.signum() // 음수면 -1, 양수면 1, 0이면 0
Int.zero; Int.isSigned

/*
 알고리즘 Swift 참고
 https://github.com/kbw2204/algorismSwift
 https://blog.slarea.com/algorithm/
 
 FileIO
 https://blog.slarea.com/algorithm/baekjoon/fileio/
 */
