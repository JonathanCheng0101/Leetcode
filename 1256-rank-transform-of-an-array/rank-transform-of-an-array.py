class Solution:
    def arrayRankTransform(self, arr: List[int]) -> List[int]:
        d = {}
        res = []

        copy_arr = (sorted(set(arr)))
        for i, ele in enumerate(copy_arr):
            d[ele] = i + 1

        for num in arr:
            res.append(d[num])

        return res