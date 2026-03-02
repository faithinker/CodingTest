//
//  TreeHeight.swift
//  CodingTest
//
//  Created by jhkim on 2026.03.02.
//

import Foundation

// 문제 못 풀음
// [TreeHeight](https://app.codility.com/programmers/trainings/4/)
class TreeHeight {
    
    //public func solution(_ root: Tree?) -> Int {
    //    func dfs(_ node: Tree?) -> Int {
    //        guard let node else { return 0 }
    //        let leftDepth = dfs(node.left)
    //        let rightDepth = dfs(node.right)
    //        return 1 + max(leftDepth, rightDepth)
    //    }
    //    return dfs(root)
    //}


    public func solution(_ root: Tree?) -> Int {
        func dfs(_ node: Tree?, _ depth: Int) -> Int {
            guard let node else {
                print("\(String(repeating: "  ", count: depth))nil → return 0")
                return 0
            }
            
            print("\(String(repeating: "  ", count: depth))노드 \(node.node) 진입")
            
            let leftDepth = dfs(node.left, depth + 1)
            let rightDepth = dfs(node.right, depth + 1)
            let result = 1 + max(leftDepth, rightDepth)
            
            print("\(String(repeating: "  ", count: depth))노드 \(node.node) → left=\(leftDepth), right=\(rightDepth), return \(result)")
            
            return result
        }
        return dfs(root, 0)
    }



    public class Tree {
        var node = 0
        var left: Tree?
        var right: Tree?
        
        public init(_ node: Int, left: Tree? = nil, right: Tree? = nil) {
            self.node = node
            self.left = left
            self.right = right
        }
        
        public init(_ node: Int, _ left: Tree? = nil, _ right: Tree? = nil) {
            self.node = node
            self.left = left
            self.right = right
        }
    }


    var a =
    Tree(5,
         left: Tree(3, left: Tree(20), right: Tree(21)),
         right: Tree(10, left: Tree(1)),
    )

    //print(solution(a))
}

//        5
//       / \
//      3   10
//     / \
//    20  21

