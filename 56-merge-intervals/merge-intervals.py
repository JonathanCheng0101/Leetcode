class Solution:
    def merge(self, intervals: List[List[int]]) -> List[List[int]]:
        res = []
        nums = sorted(intervals, key = lambda x:x[0])
        
        for num in nums:
            if len(res) == 0:
                res.append(num)

            else:
                if num[0] <= res[-1][1]:
                    res[-1][1] = max(num[1],res[-1][1]) 
                else:
                    res.append(num)

        
        return res