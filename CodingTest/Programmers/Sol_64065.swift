//
//  Sol_64065.swift
//  CodingTest
//
//  Created by jhKim on 2022/06/17.
//

import Foundation

// Index를 잘 다룰줄 알아야 하는 문제...!!
// https://velog.io/@bibi6666667/Swift-String.Index-그리고-Substring-문자열-다루기
// https://stackoverflow.com/questions/24051633/how-to-remove-an-element-from-an-array-in-swift


/// [프로그래머스 64065][2019 카카오 겨울인턴]
/// 튜플(https://programmers.co.kr/learn/courses/30/lessons/64065)
class Sol_64065 {
    
    init() {
        //solution("{{2},{2,1},{2,1,3},{2,1,3,4}}") // [2, 1, 3, 4]
        let solution = solution("{{1,2,3},{2,1},{1,2,4,3},{2}}") // [2, 1, 3, 4]
        print("solution: \(solution)")
        //solution("{{20,111},{111}}")    //[111, 20]
        //solution("{{123}}") // [123]
    }
    
    

    func solution(_ s:String) -> [Int] {
        var result = [Int]()
        
        // 1. 닫기괄호 삭제, 그후 앞 괄호 2개 삭제
        var data = s.components(separatedBy: "}").joined()
        data.removeFirst()
        data.removeFirst()
    //    print("data: \(data)")
        
        var matrix = [[String]]()
        
        // 2. 괄호를 기준으로 배열을 만듦
        var list = data.components(separatedBy: "{")
        
        print("list: \(list)")
        
        // 3. 배열을 오름차순으로 정렬
        list.sort { before, after in
            return before.count < after.count
        }

//        print("sorted :", list)
        
        // 4. 쉼표 삭제후 이중배열을 만듦
        for value in list {
            matrix.append(value.components(separatedBy: ","))
        }
        
//        print("matrix: \(matrix)")
        
        // 5. 쉼표로 인해 빈값이 생긴 경우 찾아서 삭제
        for i in 0..<matrix.count {
            for j in 0..<matrix[i].count {
                if matrix[i][j] == "" {
                    matrix[i].remove(at: j)
                }
            }
        }
        
    //    print("remove empty element Array: \(matrix)")
        
        // 6. String -> Int 자료형 변환
        var newMatrix = matrix.map { array in
            array.map { Int($0)! }
        }
        
    //    print("test: \(newMatrix)")
        
        // 7. 오름차순으로 값이 한개밖에 없기 때문에 그 값을 다른 배열에도 적용시켜 삭제한다.
        // 삭제한 값은 결과값에 1번만 담는다.
        for i in 0..<list.count {
            let number = newMatrix[i][0]
            result.append(number)

            for j in 0..<list.count {
                if let index = newMatrix[j].firstIndex(of: number) {
                    newMatrix[j].remove(at: index)
                }
            }
        }

        //print("result: \(result)")
        
        return result
    }
}
