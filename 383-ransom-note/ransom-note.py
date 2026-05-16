from collections import defaultdict
class Solution:
    def canConstruct(self, ransomNote: str, magazine: str) -> bool:
        cnt = defaultdict(int)

        for char in ransomNote:
            cnt[char] += 1

        for char in magazine:
            if char in cnt:
                cnt[char] -= 1

        
        for val in cnt.values():
            if val >0:
                return False
            
        return True