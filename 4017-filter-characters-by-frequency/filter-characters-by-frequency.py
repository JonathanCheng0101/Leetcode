from collections import Counter
class Solution:
    def filterCharacters(self, s: str, k: int) -> str:
        remove = []
        s_cnt = Counter(s)
        
        for char in s_cnt:
            if s_cnt[char] >= k:
                remove.append(char)

        res = "".join(char for char in s if char not in remove)
    
        return res