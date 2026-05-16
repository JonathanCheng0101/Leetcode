class Solution:
    def subarraySum(self, nums: List[int], k: int) -> int:
        cnt = 0
        prefix = 0
        freq = {0: 1}

        for num in nums:
            prefix += num

            if prefix - k in freq:
                cnt += freq[prefix - k]

            freq[prefix] = freq.get(prefix, 0) + 1

        return cnt