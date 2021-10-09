//
//  Log.swift
//  CodingTest
//
//  Created by pineone on 2021/10/09.
//

import Foundation

class Log {
    func LOG(_ msg: Any?, file: String = #file, function: String = #function, line: Int = #line) {
        let fileName = file.split(separator: "/").last ?? ""
        let funcName = function.split(separator: "(").first ?? ""
        print("[\(fileName)] \(funcName)(\(line) Line): \(msg ?? "")")
    }
}



