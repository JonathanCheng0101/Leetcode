# paragraph to counter wrds --> 
import re
from collections import Counter
class Solution:
    def mostCommonWord(self, paragraph: str, banned: List[str]) -> str:
        wrds = re.findall(r"[a-z]+", paragraph.lower())
        good_wrd = [wrd for wrd in wrds if wrd not in set(banned)]
        return Counter(good_wrd).most_common(1)[0][0]