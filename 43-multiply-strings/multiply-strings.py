class Solution:
    def multiply(self, num1: str, num2: str) -> str:
        res1 = 0
        res2 = 0
        for char in num1:
            digit = ord(char) - ord('0')
        
            if res1 == 0:
                res1 += digit
            else:
                res1 *= 10 
                res1 += digit
        
        for char in num2:
            digit = ord(char) - ord('0')
        
            if res2 == 0:
                res2 += digit
            else:
                res2 *= 10 
                res2 += digit
        
        return str(res1 * res2)

            
