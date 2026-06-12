class Solution:
    def insert(self, intervals: List[List[int]], newInterval: List[int]) -> List[List[int]]:
        intervals.append(newInterval)
        intervals = sorted(intervals, key = lambda x:x[0])
                
            

        res = []
        for ele in intervals:
            if len(res) == 0:
                res.append(ele)
            else:
                if res[-1][1] >= ele[0]:
                    res[-1][1] = max(res[-1][1], ele[1])
                else:
                    res.append(ele)

        return res