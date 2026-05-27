class Solution:
    def isAlienSorted(self, words: List[str], order: str) -> bool:
        d = {}
        prev = -inf
        for i, ele in enumerate(list(order)):
            d[ele] = i
        
        for i in range(len(words)-1):

            wrd1 = words[i]
            wrd2 = words[i + 1]

            for c1, c2 in zip(wrd1, wrd2):
                if c1 != c2:
                    if d[c1] > d[c2]:
                        return False


                    break
            else:
                if len(wrd1) > len(wrd2):
                    return False

        
        return True

        