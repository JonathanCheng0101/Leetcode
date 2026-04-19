class Solution:
    def validPalindrome(self, s: str) -> bool:

        def isPalindrome(s, l, r):
            while l < r:
                if s[l] == s[r]:
                    l += 1
                    r -= 1
                else:
                    return False
            return True

        cnt = 1
        left, right = 0, len(s) - 1
        while left < right:
            if s[left] != s[right]:
                return isPalindrome(s,left + 1, right) or isPalindrome(s,left, right - 1)               
            else:
                left += 1
                right -= 1
            
        return True
            
                
            
