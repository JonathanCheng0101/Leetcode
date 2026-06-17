class Solution:
    def removeOuterParentheses(self, s: str) -> str:
        depth = 0
        res = []

        for char in s:
            if char == "(":
                if depth != 0:
                    res.append(char)

                depth += 1
            
            else:
                depth -= 1
                if depth != 0:
                    res.append(char)
        
        return "".join(res)


        