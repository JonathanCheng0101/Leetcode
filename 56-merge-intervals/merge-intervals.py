class Solution:
    def merge(self, intervals: List[List[int]]) -> List[List[int]]:
        intervals = sorted(intervals, key = lambda x: x[0])
        res = []

        for ele in intervals:
            if not res:
                res.append(ele)
            else:
                if ele[0] <= res[-1][1]:
                    res[-1][1] = max(ele[1], res[-1][1])
                else:
                    res.append(ele)
        
        return res


        