from collections import Counter
class Solution:
    def commonChars(self, words: List[str]) -> List[str]:
        cur = Counter(words[0])
        for i in range(len(words)- 1):
            new_cur = cur & Counter(words[i + 1])
            cur = new_cur

        res = ""
        for k, v in cur.items():
            res += k*v 
        


        return list(res)