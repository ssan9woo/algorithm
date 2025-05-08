/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */

class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root else { return [] }

        var ans: Array<Array<Int>> = [[root.val]]
        var q: Array<TreeNode> = [root]

        while !q.isEmpty {
            var values: Array<Int> = []

            for _ in 0..<q.count {
                let node = q.removeFirst()

                if let leftNode = node.left {
                    q.append(leftNode)
                    values.append(leftNode.val)
                }

                if let rightNode = node.right {
                    q.append(rightNode)
                    values.append(rightNode.val)
                }
            }

            if !values.isEmpty {
                ans.append(values)
            }
        }

        return ans
    }
}