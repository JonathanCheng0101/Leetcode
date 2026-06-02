class Solution:
    def numRescueBoats(self, people: List[int], limit: int) -> int:
        res = 0
        l, r = 0, len(people) - 1

        lst = sorted(people)
        while l <= r:
            if lst[r] + lst[l] <= limit:
                l += 1

            
            res += 1
            r -= 1
        
        return res
            

        