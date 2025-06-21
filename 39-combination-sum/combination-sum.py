class Solution:
    def combinationSum(self, candidates: List[int], target: int) -> List[List[int]]:
        res = []
        temp_lst = []

        def dfs(cur):
            if cur == target:
                new_lst = sorted(temp_lst)
                if new_lst not in res:
                    res.append(new_lst.copy())
                return
            elif cur > target:
                return
                
            else:
                for i in range(len(candidates)):
                    temp_lst.append(candidates[i])
                    cur += candidates[i]

                    dfs(cur)

                    temp_lst.pop()
                    cur -= candidates[i]

        dfs(0)

        return res




                