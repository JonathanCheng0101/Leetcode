class Solution:
    def merge(self, intervals: List[List[int]]) -> List[List[int]]:
        res = []

        lst = sorted(intervals, key = lambda x: (x[0], x[1]))

        for ele in lst:
            if not res:
                res.append(ele)
            else:
                # cur = res[-1],  nxt = ele
                # non overlapping
                if res[-1][1] < ele[0]:
                    res.append(ele)
                else:
                    res[-1][1] = max(res[-1][1], ele[1])

        
        return res
                