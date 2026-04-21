class Solution:
    def majorityElement(self, nums: List[int]) -> int:
        cnt = {}
        for num in nums:
            cnt[num]  = cnt.get(num, 0) + 1

        for k, v in cnt.items():
            if v > len(nums)//2:
                return k