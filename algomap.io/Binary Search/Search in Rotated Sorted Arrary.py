class Solution:
    def search(self, nums: List[int], target: int) -> int:
        left, right = 0, len(nums) - 1

        while left <= right:
            mid = (left + right) // 2

            if target == nums[mid]:
                return mid

            # 현재 mid 기준으로 왼쪽, 오른쪽 배열의 연속성 여부 확인

            # 왼쪽 절반이 정렬 된 상태
            # 정렬이 된 상태만 보는거지, 해당 영역에 있다는게 아님
            if nums[left] <= nums[mid]:
                # target 이 정렬된 왼쪽 배열 범위 내에 포함된다면
                # target <= nums[mid] 조건이 아닌 이유는, 위에서 이미 target == nums[mid] 조건을 판별했기 때문에 target 은 nums[mid]와 같지 않고, 작거나 크게 된다.
                if nums[left] <= target < nums[mid]:
                    right = mid - 1
                # 왼쪽 배열에 포함되지 않는다? -> 오른쪽 영역에 있음
                else:
                    left = mid + 1
            # 왼쪽 절반이 정렬되어 있지 않다면 오른쪽 정렬은 무조건 정렬되어있음
            # 왜냐? 왼쪽 절반이 정렬되어 있지 않다면, 회전 지점(pivot)이 반드시 왼쪽에 포함됨.
            # 그러므로 pivot의 오른쪽은 무조건 정렬되어있다고 생각할 수 있음.
            else:
                # target 이 정렬된 오른쪽 배열 범위 내에 포함된다면
                if nums[mid] < target <= nums[right]:
                    left = mid + 1
                # 오른쪽 배열에 포함되지 않는다? -> 왼쪽 영역에 있음
                else:
                    right = mid - 1
        
        return -1