class Solution:
    def subsets(self, nums: List[int]) -> List[List[int]]:
        res = []
        temp_lst = []
        def dfs(start_index):
            res.append(temp_lst.copy())

            for i in range(start_index, len(nums)):
                temp_lst.append(nums[i])

                dfs(i + 1)
                temp_lst.pop()

        dfs(0)

        return res

