class Solution:
    def intersect(self, nums1: List[int], nums2: List[int]) -> List[int]:
        res1 = {}
        final = []
        for ele in nums1:
            ele = str(ele)
            if ele not in res1:
                res1[ele] = 1
            else:
                res1[ele] += 1

        for ele in nums2:
            ele = str(ele)
            if ele in res1 and res1[ele] > 0:
                res1[ele] -= 1
                final.append(int(ele))

        return final