class Solution {
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var count: Int = 0
        var ans: Int = 0

        func inOrder(_ node: TreeNode?) {
            guard let node else { return }

            // 왼쪽 노드 방문
            inOrder(node.left)

            // 현재 노드 방문
            // 방문하면서 현재 노드가 k번째인지 확인
            count += 1
            if count == k {
                ans = node.val
                return
            }
            
            // 오른쪽 노드 방문
            inOrder(node.right)
        }

        inOrder(root)
        return ans
    }
}