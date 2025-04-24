class Solution:
    def containsDuplicate(self, nums: List[int]) -> bool:
        container = set()
        for num in nums:
            if num not in container:
                container.add(num)
            else:
                return True

        return False