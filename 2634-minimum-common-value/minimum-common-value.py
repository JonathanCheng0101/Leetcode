class Solution:
    def getCommon(self, nums1: List[int], nums2: List[int]) -> int:
        res = -1

        l, r = 0, 0

        while l <= len(nums1) - 1 and r <= len(nums2) - 1:
            if nums1[l] == nums2[r]:
                res = nums1[l]
                return res

            else:
                if nums1[l] > nums2[r]:
                    
                    r += 1

                else:
                    l += 1

        return res
