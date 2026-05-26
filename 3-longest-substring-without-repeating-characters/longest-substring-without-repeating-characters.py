class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        left = 0
        res = ""
        def is_valid(s:str):
            d = set()
            for char in s:
                if char in d:
                    return False
                else:
                    d.add(char)
            return True

    
        for right in range(left + 1, len(s) + 1):
            new_s = s[left:right]
            if is_valid(new_s):
                if len(new_s) > len(res):
                    res = new_s
            else:
                left += 1

        return len(res) 


