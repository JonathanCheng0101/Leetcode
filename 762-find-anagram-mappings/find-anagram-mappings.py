class Solution:
    def anagramMappings(self, nums1: List[int], nums2: List[int]) -> List[int]:
        res = []
        nums2_dict = {}
        for i, num in enumerate(nums2):
            nums2_dict[num] = i
        
        for num in nums1:
            res.append(nums2_dict[num])
        
        return res