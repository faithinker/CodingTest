//
//  ReadLine.swift
//  CodingTest
//
//  Created by jhKim on 2022/05/16.
//

import Foundation

/// https://thoonk.tistory.com/2
/// https://www.innoq.com/en/blog/swift-cli-words-1/
/// https://0urtrees.tistory.com/162


/// 키보드 입력받기 공통 구조체!!
///
/// ===================== ReadLine =====================
struct ReadLine {
    
    let read = readLine()!
    
    func multipleWithIntTuple(num: Int) -> [(Int, Int)] {
        
        var arrIntTuple: [(Int, Int)] = [getTwoTupleInt()]
        
        for _ in 1..<num {
            arrIntTuple.append(getTwoTupleInt(newRead: readLine()))
        }
        
        return arrIntTuple
    }
    
    /// 여러줄(개행) 입력받고 Int형 일차원 배열로 변환
    func multipleNewLine(num: Int) -> [Int] {
        // 제네릭 타입으로 고치기 또는 리턴타입 [String]도 될수있도록 수정?
        var arr: [Int] = [getInt()]
        
        for _ in 1..<num {
            arr.append(Int(readLine()!)!)
        }
        
        return arr
    }
    
    /// 연속적으로 오는 문자를 String 배열로 변환
    /// "abc" -> ["a", "b", "c"]
    func getStringArray() -> [String] {
        return Array("numbers").map {String($0)}
    }
    
    /// 연속적으로오는 숫자를 Int 배열로 변환
    /// "123" -> [1, 2, 3]
    func getIntArray() -> [Int] {
        return Array(read).map {Int(String($0))!}
    }
    
    /// 공백있는 문자를 String 배열로 변환
    /// "1 a 2" -> ["1", "a", "2"]
    func getArrString() -> [String] {
        return read.split(separator: " ").map { String($0) }
    }
    
    /// 공백있는 숫자를 Int 배열로 변환
    /// "1 3 5" -> [1, 3, 5]
    func getArrInt() -> [Int] {
        return read.split(separator: " ").map { Int(String($0))! }
    }
    
    func getInt() -> Int {
        return Int(read)!
    }
    
    func getTwoTupleInt(newRead: String? = nil) -> (Int, Int) {
        if let text = newRead {
            let first = Int(String(text.split(separator: " ").first!))!
            let second = Int(String(text.split(separator: " ").last!))!
            return (first, second)
        } else {
            let arr = getArrInt()
            return (arr[0], arr[1])
        }
    }
    
    /// 가끔 index Range Out of 뜨는데 재입력하면 된다. 또는 arr만 따로 출력해서 테스트도 필요하다.
    func getThreeTupleInt() -> (Int, Int, Int) {
        let arr = getArrInt()
        return (arr[0], arr[1], arr[2])
    }
    
    /// N x N 으로 입력된 숫자들을 이차원 배열로 변환
    func matrixInt(_ n: Int) -> [[Int]] {
        var matrix = [[Int]]()
        // read 변수가 전역변수이기 때문에 클래스 생성시 무조건 입력 받아서 써야한다.
        matrix.append(read.split(separator: " ").map { Int(String($0))! })
        
        for _ in 1..<n {
            matrix.append(readLine()!.split(separator: " ").map { Int(String($0))! })
        }
        return matrix
    }
    
    /// 백준에서 N x M, N x N 행렬 출력하는 함수
    ///
    /// ```swift
    /// 2 5
    /// 1 3 2 7 5
    /// 2 8 6 4 5
    /// ```
    /// 위의 것 그대로 터미널에 복붙하면 된다.
    func matrixPrint() -> [[Int]] {
        var matrix = [[Int]]()
        
        let arr = read.split(separator: " ").map { Int(String($0))! }
        let n = arr[0] // 세로 열
        //let m = arr[1] // 가로 행
        
        for _ in 0..<n {
            matrix.append(readLine()!.split(separator: " ").map { Int(String($0))! })
        }
        
        Helper().lintPrint(matrix)
        
        return matrix
    }
}

struct BojRead {
    
    let read = readLine()!
    
    func getInt() -> Int {
        return Int(read)!
    }
}
