class Solution:
    def nextGreaterElement(self, nums1: List[int], nums2: List[int]) -> List[int]:
        d = {}
        final = []
        for i, num in enumerate(nums2):
            cur = -1
            for j in range(i+ 1, len(nums2)):
                if nums2[j] > num:
                    cur = nums2[j]
                    break
            
            d[num] = cur

        for num in nums1:
            final.append(d[num])

        return final