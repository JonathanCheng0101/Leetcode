class Solution:
    def evalRPN(self, tokens: List[str]) -> int:
        res = []
        polish_set = {'+', '-', '*', '/'}
        
        for token in tokens:
            if token not in polish_set:
                res.append(int(token))
            else:
                a = res.pop() #後面
                b = res.pop()

                if token == "+":
                    res.append(a + b)
                elif token == "-":
                    res.append(b - a)
                elif token == "*":
                    res.append(a * b)
                elif token == "/":
                    res.append(int(b / a))
                
        return res[-1]
                

       