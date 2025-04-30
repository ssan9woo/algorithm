class Solution {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root else { return nil }

        let temp = root.left
        root.left = root.right
        root.right = temp

        invertTree(root.left)
        invertTree(root.right)

        return root
    }
}