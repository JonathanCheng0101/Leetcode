class Solution:
    def insert(self, intervals: List[List[int]], newInterval: List[int]) -> List[List[int]]:
        res = []

        intervals.append(newInterval)
        lst = sorted(intervals, key = lambda x: (x[0], x[1]))

        for ele in lst:
            if not res:
                res.append(ele)
            else:
                # non overlapping
                # cur = res[-1]    nxt = ele 
                if res[-1][1] < ele[0]:
                    res.append(ele)
                else:
                    res[-1][1] = max(res[-1][1], ele[1])

        return res

        