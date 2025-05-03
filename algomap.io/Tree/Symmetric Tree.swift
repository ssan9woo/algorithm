class Solution {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        let left = root?.left
        let right = root?.right

        return dfs(left, right)
    }

    func dfs(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil { return true }

        if p == nil || q == nil { return false }

        if p?.val != q?.val { return false }

        return dfs(p?.left, q?.right) && dfs(p?.right, q?.left)
    }
}