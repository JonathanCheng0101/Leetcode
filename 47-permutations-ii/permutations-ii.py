from collections import Counter
class Solution:
    def permuteUnique(self, nums: List[int]) -> List[List[int]]:
        res = []
        temp_lst = []
        counter = Counter(nums)

        def dfs():
            if len(nums) == len(temp_lst):
                res.append(temp_lst.copy())

            for n in counter:
                if counter[n] > 0:
                    temp_lst.append(n)
                    counter[n] -= 1

                    dfs()

                    temp_lst.pop()
                    counter[n] += 1

        dfs()
        return res



        
        