class Solution:
    def generateParenthesis(self, n: int) -> List[str]:
        # n means n open and n closed paranthesis
        # only add open paranthesis if open < n
        # only add closed when close < open
        # valid when n == closed == open
        res = []
        temp_lst = []

        def dfs(start_index, open_count, close_count):
            if start_index == 2 * n:   #success
                res.append("".join(temp_lst))
                
            if open_count < n:
                temp_lst.append("(")
                dfs(start_index + 1, open_count + 1, close_count)
                temp_lst.pop()

            if  close_count < open_count:
                temp_lst.append(")")
                dfs(start_index + 1, open_count, close_count + 1)
                temp_lst.pop()

        
        dfs(0, 0, 0)
        return res