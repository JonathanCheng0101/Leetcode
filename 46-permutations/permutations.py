class Solution:
    def permute(self, nums: List[int]) -> List[List[int]]:
        res = []
        temp_lst = []
        used = [False] * len(nums)


        def dfs():
            if len(temp_lst) == len(nums):
                res.append(temp_lst[:])
                return 

            for i in range(len(nums)):
                if used[i]:
                    continue
                used[i] = True
                temp_lst.append(nums[i])

                dfs()
                temp_lst.pop()
                used[i] = False
     
        dfs()
        return res
        