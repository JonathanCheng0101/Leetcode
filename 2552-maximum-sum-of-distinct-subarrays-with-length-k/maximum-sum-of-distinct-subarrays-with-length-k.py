from collections import Counter
class Solution:
    def maximumSubarraySum(self, nums: List[int], k: int) -> int:
        window = nums[:k]
        cnt = Counter(window)
        cur_sum = sum(window)
        res = 0

        if len(cnt) == k:
            res = cur_sum

        for i in range(k, len(nums)):
            incoming = nums[i]
            outgoing = nums[i - k]

            # delete old
            cnt[outgoing] -= 1
            if cnt[outgoing] == 0:
                del cnt[outgoing]
            cur_sum -= outgoing

            # add new
            cnt[incoming] = cnt.get(incoming, 0) + 1
            cur_sum += incoming

            # chk distinct
            if len(cnt) == k:
                res = max(res, cur_sum)

        return res
   