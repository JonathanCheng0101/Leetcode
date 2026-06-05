from collections import Counter
class Solution:
    def maximumSubarraySum(self, nums: List[int], k: int) -> int:
        res = 0

        window = Counter(nums[:k])
        cur_sum = sum(nums[:k])

        if len(window) == k:
            res = sum(window)

        for i in range(k, len(nums)):
            incoming = nums[i]
            outgoing = nums[i - k]

            window[outgoing] -= 1
            if window[outgoing] == 0:
                del window[outgoing]
            window[incoming] = window.get(incoming, 0) + 1 

            cur_sum -= outgoing
            cur_sum += incoming

            if len(window) == k:
                res = max(res, cur_sum)

        return res
