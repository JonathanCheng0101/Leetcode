class Solution:
    def findTheDistanceValue(self, arr1: List[int], arr2: List[int], d: int) -> int:
        bad = 0
        res = 0
        for ele in arr1:
            for num in arr2:
                if abs(num - ele) <= d:
                    bad += 1
            if bad == 0:
                res += 1
            bad = 0
        return res


        