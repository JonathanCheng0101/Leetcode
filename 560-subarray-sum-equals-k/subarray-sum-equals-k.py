class Solution:
    def subarraySum(self, nums: List[int], k: int) -> int:
        res = 0
        total = 0
        prefix = {0:1} # sum: 次數

        for num in nums:
            total += num

            if total - k in prefix:
                res += prefix[total - k]
            
            if total in prefix:
                prefix[total] += 1
            else:
                prefix[total] = 1
        
        return res

            


        