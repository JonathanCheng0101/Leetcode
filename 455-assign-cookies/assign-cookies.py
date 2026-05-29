class Solution:
    def findContentChildren(self, g: List[int], s: List[int]) -> int:
        res = 0
        left = 0
        if len(s) == 0:
            return 0

        g = sorted(g, reverse = False)
        s = sorted(s, reverse = False)


        for ele in g:
            while left < len(s) and ele > s[left]:
                left += 1

            if left == len(s):
                return res
            
            res += 1
            left += 1

        return res

            




        