class Solution:
    def intervalIntersection(self, firstList: List[List[int]], secondList: List[List[int]]) -> List[List[int]]:
        l, r = 0, 0
        lst1 = firstList
        lst2 = secondList
        res = []

        while l < len(lst1) and r < len(lst2):
            # overlapping
            if lst1[l][1] >= lst2[r][0] and lst1[l][0] <= lst2[r][1]:
                left_side = max(lst1[l][0], lst2[r][0])
                right_side = min(lst1[l][1], lst2[r][1])
                res.append([left_side, right_side])

            # l or r moving
            if lst1[l][1] <= lst2[r][1]:
                l += 1
            else:
                r += 1
        
        return res
