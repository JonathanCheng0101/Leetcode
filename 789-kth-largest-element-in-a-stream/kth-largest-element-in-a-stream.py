from heapq import heapify, heappush, heappop
class KthLargest:
    def __init__(self, k: int, nums: List[int]):
            self.k = k
            self.nums = nums
            heapify(self.nums)

            while len(nums)> k:
                heappop(nums)

    def add(self, val: int) -> int:
        heappush(self.nums, val)

        if len(self.nums) > self.k:
            heappop(self.nums)

        return self.nums[0]


