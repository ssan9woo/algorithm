class Solution {
    func isBalanced(_ root: TreeNode?) -> Bool {
        return dfs(root) != -1
    }

    private func dfs(_ node: TreeNode?) -> Int {
        guard let node = node else { return 0 }

        let left = dfs(node.left)
        if left == -1 { return -1 }

        let right = dfs(node.right)
        if right == -1 { return -1 }

        if abs(left - right) > 1 {
            return -1
        }

        return max(left, right) + 1
    }
}