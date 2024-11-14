class Solution:
    def generateParenthesis(self, n: int) -> List[str]:
        # n means n open and n closed paranthesis
        # only add open paranthesis if open < n
        # only add closed when close < open
        # valid when n == closed == open

        stack = []
        res = []

        def backtrack(openN, closeN):
            if n == openN == closeN:
                res.append("".join(stack))
            if openN < n:
                stack.append("(")
                backtrack(openN + 1, closeN)
                stack.pop()
            
            if closeN < openN:
                stack.append(")")
                backtrack(openN, closeN + 1)
                stack.pop()
        backtrack(0,0)

        return res

        