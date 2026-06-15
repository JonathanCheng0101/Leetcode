class Solution:
    def intervalIntersection(self, firstList: List[List[int]], secondList: List[List[int]]) -> List[List[int]]:
        res = []
        lst1 = firstList
        lst2 = secondList

        l, r = 0, 0

        while l < len(lst1) and r < len(lst2):
            # compare lst1[l]  lst2[r]
            if lst1[l][0] <= lst2[r][1] and lst1[l][1] >= lst2[r][0]:
                left_side = max(lst1[l][0], lst2[r][0])
                right_side = min(lst1[l][1], lst2[r][1])
            
                temp = [left_side, right_side]
                res.append(temp)

                # compare
            if lst1[l][1] >= lst2[r][1]:
                r += 1
            else: 
                l += 1


        return res
            


