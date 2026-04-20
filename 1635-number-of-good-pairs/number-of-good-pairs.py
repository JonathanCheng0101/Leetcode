class Solution:
    def numIdenticalPairs(self, nums: List[int]) -> int:
        def combine(num):
            return (num)*(num-1) / 2
        total= 0
        num_dict = {}
        for num in nums:
            num_dict[num] = num_dict.get(num, 0) + 1

        for val in num_dict.values():
            total += (val)*(val - 1) / 2

        return int(total)