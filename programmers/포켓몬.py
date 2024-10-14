def solution(nums):
    n = len(nums)
    return min(len(set(nums)), n // 2)