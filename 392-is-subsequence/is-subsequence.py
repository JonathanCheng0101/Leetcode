class Solution:
    def isSubsequence(self, s: str, t: str) -> bool:
        left = 0
        
        for char in s:
            if left < len(t) and t[left] == char:
                left += 1
            else:
                while left < len(t) and t[left] != char:
                    left += 1

                if left == len(t):
                    return False 

                left += 1                       

                
        return True
            

      