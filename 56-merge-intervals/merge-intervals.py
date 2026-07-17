class Solution:
    def merge(self, intervals: List[List[int]]) -> List[List[int]]:
        sorted_s = sorted(intervals, key = lambda x: (x[0], x[1]))
        res = []

        for ele in sorted_s:
            if not res:
                res.append(ele)
            else:
                # check intervals
             
                if res[-1][1] >= ele[0]:
                    res[-1][1] = max(res[-1][1], ele[1])
                
                else:
                    res.append(ele)
        
        return res
       