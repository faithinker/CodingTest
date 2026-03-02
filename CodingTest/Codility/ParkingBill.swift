//
//  ParkingBill.swift
//  CodingTest
//
//  Created by jhkim on 2026.03.01.
//

import Foundation


/// [ParkingBill](https://app.codility.com/programmers/trainings/5/)
class ParkingBill {
    
    public func solution(_ E : inout String, _ L : inout String) -> Int {
        let e = E.split(separator: ":").map { Int($0)! }
        let l = L.split(separator: ":").map { Int($0)! }
        let time = (l[0] - e[0]) * 60 + l[1] - e[1] - 60
        let share = time / 60
        
        var remain = 0
        if time > 0 {
            remain = time % 60 == 0 ? 0 : 1
        }
        
        // 2(입장) + 3(첫 1시간) + 4×N(나머지 N시간)
        let result = 2 + 3 + share * 4 + remain * 4
        
    //    print(e, l)
    //    print(time, share, remain, result)
        return result
    }

    func inputTest() {
        
        var aE = "10:00"
        var aL = "13:21"
        let a = solution(&aE, &aL)
        // 2(입장) + 3(첫 1시간) + 4×3(나머지 3시간) = 17


        var bE = "09:42"
        var bL = "11:42"
        let b = solution(&bE, &bL)
        // 2 + 3 + 4 = 9


        var cE = "18:21"
        var cL = "18:29"
        let c = solution(&cE, &cL) // 5


        //'17:00', '18:48'
        var dE = "17:00"
        var dL = "18:48"
        let d = solution(&dE, &dL) // 9
        print(a, b, c, d)

        
    }

    //GPT 답변 근본적으로 time이 음수가 될 수 있는 설계이기 때문에 아래와 같이 수정
     
     public func solution1(_ E: inout String, _ L: inout String) -> Int {
         func toMinutes(_ s: String) -> Int {
             let parts = s.split(separator: ":")
             return Int(parts[0])! * 60 + Int(parts[1])!
         }

         let start = toMinutes(E)
         let end = toMinutes(L)
         let diff = end - start

         let hours = (diff + 59) / 60

         if hours <= 1 { return 2 + 3 }
         return 2 + 3 + (hours - 1) * 4
     }
}
