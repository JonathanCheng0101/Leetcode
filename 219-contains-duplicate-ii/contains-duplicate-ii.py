from collections import defaultdict
class Solution:
    def containsNearbyDuplicate(self, nums: List[int], k: int) -> bool:
        d = defaultdict(list)
        for i, num in enumerate(nums):
            d[num].append(i)

        
        for num in d:
            if len(d[num]) > 1:
                for i in range(0, len(d[num])-1):
                    if d[num][i + 1] - d[num][i] <= k:
                        return True

        return False
        

            
