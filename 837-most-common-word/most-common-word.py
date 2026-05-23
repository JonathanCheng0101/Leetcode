# paragraph to counter wrds --> 
import re
from collections import Counter
class Solution:
    def mostCommonWord(self, paragraph: str, banned: List[str]) -> str:
        wrds = re.findall(r"[a-z]+", paragraph.lower())
        sorted_wrd = sorted(Counter(wrds).items(), key = lambda x: x[1], reverse = True)
        
        for k, _ in sorted_wrd:
            if k in banned:
                continue
            else:
                return k