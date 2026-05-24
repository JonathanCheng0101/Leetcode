from collections import Counter
class Solution:
    def countCharacters(self, words: List[str], chars: str) -> int:
        res = 0

        for wrd in words:
            if Counter(wrd) <= Counter(chars):
                res += len(wrd)

        return res
