class Solution:
    def validPalindrome(self, s: str) -> bool:
        remain = 1

        def is_palindrome(s):
            left, right = 0, len(s)-1
            while left <= right:
                if s[left] != s[right]:
                    return False
                left += 1
                right -= 1
                
            return True

        left, right = 0, len(s) - 1
        while left < right:
            if s[left] != s[right]:
                if is_palindrome(s[left+1:right + 1]) or is_palindrome(s[left:right]):
                    return True
                else:
                    return False
                
            left += 1
            right -= 1

        return True
