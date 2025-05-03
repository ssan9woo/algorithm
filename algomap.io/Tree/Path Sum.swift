class Solution {
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let root else { return false }

        let nextTarget = targetSum - root.val
        if nextTarget == 0 && root.left == nil && root.right == nil {
            return true
        }

        return hasPathSum(root.left, nextTarget) || hasPathSum(root.right, nextTarget)
    }
}