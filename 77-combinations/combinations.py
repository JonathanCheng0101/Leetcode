class Solution:
    def combine(self, n: int, k: int) -> List[List[int]]:
        res = []
        temp_lst = []

        def dfs(start):
            if len(temp_lst) == k:
                res.append(temp_lst[:])
                return 

            else:
                for i in range(start, n + 1):
                    temp_lst.append(i)
                    dfs(i + 1)
                    temp_lst.pop()

        dfs(1)

        return res
        