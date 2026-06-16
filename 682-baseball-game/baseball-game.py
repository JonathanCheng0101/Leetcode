class Solution:
    def calPoints(self, operations: List[str]) -> int:
        res = []

        for char in operations:
            if char == "+":
                res.append(res[-1]+res[-2])
            elif char == "D":
                res.append(res[-1] * 2)
            elif char == "C":
                res.pop()
            else:
                res.append(int(char))

        
        return sum(res)
        