class Solution:
    def merge(self, intervals: List[List[int]]) -> List[List[int]]:
        # start 기준 정렬
        intervals = sorted(intervals, key = lambda x : x[0])
        
        ans = []
        start, end = intervals[0][0], intervals[0][1]

        for interval in intervals:
            start_i, end_i = interval[0], interval[1]

            if start_i <= end:
                end = max(end, end_i)
            else:
                ans.append([start, end])
                start, end = start_i, end_i

        ans.append([start, end])

        return ans