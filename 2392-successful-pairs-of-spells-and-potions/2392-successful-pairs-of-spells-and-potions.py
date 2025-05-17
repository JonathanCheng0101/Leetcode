class Solution:
    def successfulPairs(self, spells: List[int], potions: List[int], success: int) -> List[int]:
        potions.sort()
        res = []  # result 
        for spell in spells:
            
            l, r = 0, len(potions) - 1
            cnt = 0
            min_can = len(potions)
            while l <= r:
                mid = (l + r) // 2
                if potions[mid] * spell >= success: # middle is too big, find boundary in left
                    min_can = mid
                    r = mid - 1
                else:
                    l = mid + 1
            cnt = len(potions) - min_can # count for each successful spell
            res.append(cnt)

        return res