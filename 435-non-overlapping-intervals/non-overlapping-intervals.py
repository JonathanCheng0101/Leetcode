class Solution:
    def eraseOverlapIntervals(self, intervals: List[List[int]]) -> int:
        res = []
        lst = sorted(intervals, key = lambda x: (x[0], x[1]))

        for ele in lst:
            if not res:
                res.append(ele)
            
            else:
                # non overlapping
                # cur = res[-1],  next = ele

                if res[-1][1] <= ele[0]:
                    res.append(ele)
                
                else:
                    # overlap
                    res[-1][1] = min(ele[1], res[-1][1])

        return len(intervals) - len(res)
        