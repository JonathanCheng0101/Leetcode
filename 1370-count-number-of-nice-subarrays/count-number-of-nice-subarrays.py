class Solution:
    def numberOfSubarrays(self, nums: List[int], k: int) -> int:
        def at_most(k):
            res = 0
            odd = 0
            l = 0

            for r in range(len(nums)):
                if nums[r] % 2 == 1:
                    odd += 1
                while odd > k:
                    if nums[l] % 2 == 1:
                        odd -= 1
                    l += 1


                res += r - l + 1

            return res

        return at_most(k)- at_most(k-1)


                