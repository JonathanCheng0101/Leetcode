class Solution:
    def checkIfPangram(self, sentence: str) -> bool:
        d = set()
        for char in sentence:
            if char not in d:
                d.add(char)
            else:
                continue
        
        return len(d) == 26
        