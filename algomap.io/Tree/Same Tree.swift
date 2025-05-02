class Solution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        // 둘 다 nil이면 true
        if p == nil && q == nil { return true }

        // 둘 중 하나만 nil이거나, value 값이 다르면 nil
        if p == nil || p == nil || p?.val != q?.val {
            return false
        }

        // 두 노드의 value가 같으니 자식들 확인
        return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
    }
}