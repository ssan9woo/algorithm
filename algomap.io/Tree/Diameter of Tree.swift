class Solution {
    var diameter: Int = 0
    
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        _ = dfs(root)
        return diameter
    }

    func dfs(_ node: TreeNode?) -> Int {
        guard let node else { return 0 }

        let left = dfs(node.left)
        let right = dfs(node.right)

        diameter = max(diameter, left + right)

        return max(left, right) + 1
    }
}