class Solution {
    func getMinimumDifference(_ root: TreeNode?) -> Int {
        var lastVal: Int?
        var ans: Int = 100001

        func inOrder(_ node: TreeNode?) {
            guard let node else { return }

            // 왼쪽 노드 방문
            inOrder(node.left)

            // 현재 노드 방문하면서, 이전 노드의 value값과의 차이를 비교해서 ans 갱신
            // 마지막 value 값이 존재하는 가정 하에
            if let lastVal = lastVal {
                // 현재 node값이 더 큼 (중위 순회)
                let diff = node.val - lastVal
                // 더 작은 값으로 갱신
                ans = min(ans, diff)
            }
            // 마지막 방문 value 갱신
            lastVal = node.val

            // 오른쪽 노드 방문
            inOrder(node.right)
        }

        inOrder(root)
        return ans
    }
}