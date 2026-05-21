from collections import defaultdict, Counter
class Solution:
    def canConstruct(self, ransomNote: str, magazine: str) -> bool:
        # r 是 m 的子集合
        return not (Counter(ransomNote) - Counter(magazine))
    