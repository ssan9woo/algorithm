# leetcode_0238_product_of_array_except_self.py

from typing import List

# ✅ 정석 풀이: O(n) 시간, O(n) 공간
def product_except_self_v1(nums: List[int]) -> List[int]:
    N = len(nums)
    left = [1] * N
    right = [1] * N

    for i in range(1, N):
        left[i] = left[i-1] * nums[i-1]

    for i in range(N-2, -1, -1):
        right[i] = right[i+1] * nums[i+1]

    return [left[i] * right[i] for i in range(N)]


# ✅ 최적화 풀이: O(n) 시간, O(1) 공간 (output 제외)
def product_except_self_v2(nums: List[int]) -> List[int]:
    N = len(nums)
    res = [1] * N

    # 왼쪽 누적 곱 저장
    for i in range(1, N):
        res[i] = res[i-1] * nums[i-1]

    # 오른쪽 누적 곱 곱해주기
    right = 1
    for i in reversed(range(N)):
        res[i] *= right
        right *= nums[i]

    return res


# 🧪 간단한 테스트
if __name__ == "__main__":
    sample = [1, 2, 3, 4]
    print("v1:", product_except_self_v1(sample))  # [24, 12, 8, 6]
    print("v2:", product_except_self_v2(sample))  # [24, 12, 8, 6]