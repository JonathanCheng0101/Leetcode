from collections import Counter
class Solution:
    def frequencySort(self, s: str) -> str:
        res = ""
        s_cnt = Counter(s)
        sorted_s = sorted(s_cnt.items(), key = lambda x:- x[1])
        print(sorted_s)

        for char, freq in sorted_s:
            res += char * freq
        
        return res
