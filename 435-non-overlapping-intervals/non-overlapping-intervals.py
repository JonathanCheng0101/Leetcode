class Solution:
    def eraseOverlapIntervals(self, intervals: List[List[int]]) -> int:
        intervals = sorted(intervals, key = lambda x: (x[0], x[1]))
        res = []
        for ele in intervals:
            if not res:
                res.append(ele)

            else:
                if ele[0] < res[-1][1]:
                    res[-1][1] = min(ele[1], res[-1][1])
                else:
                    res.append(ele)

        return len(intervals) - len(res)