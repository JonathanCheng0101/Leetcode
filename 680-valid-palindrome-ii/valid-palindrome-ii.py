class Solution:
    def validPalindrome(self, s: str) -> bool:
        def is_palindrome(wrd):
            l, r = 0, len(wrd) - 1
            while l <= r:
                if wrd[l] != wrd[r]:
                    return False
                l += 1
                r -= 1
            return True
        
        chance = 1

        l, r = 0, len(s) - 1
        while l <= r:
            if s[l] == s[r]:
                l += 1
                r -= 1
            else:
                return is_palindrome(s[l:r]) or is_palindrome(s[l+ 1:r+1])
                    
        return True
                    



        