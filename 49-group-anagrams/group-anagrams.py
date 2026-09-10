class Solution:
    def groupAnagrams(self, strs: List[str]) -> List[List[str]]:
        d = {}
        for word in strs:
            word_key = ''.join(sorted(word))
            print(word_key)
            if word_key not in d:
                d[word_key] = [word]
            else:
                d[word_key].append(word)

        
        return list(d.values())
       


    
     