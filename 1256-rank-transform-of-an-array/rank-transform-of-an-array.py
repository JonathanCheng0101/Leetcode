class Solution:
    def arrayRankTransform(self, arr: List[int]) -> List[int]:
        res = []
        d = {}
        cur = 1 
        sort_arr = sorted(arr, reverse = False)
        for ele in sort_arr:
            if ele not in d:
                d[ele] = cur
                cur += 1

        for num in arr:
            res.append(d[num])

        return res