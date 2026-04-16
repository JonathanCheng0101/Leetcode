class Solution:
    def groupAnagrams(self, strs: List[str]) -> List[List[str]]:
        mp = {}
        #ord(ch) - ord('a')
        for ele in strs:
            cur = [0] * 26
            for char in ele:
                cur[ord(char) - ord('a')] += 1
            
            key = tuple(cur) # list不能當dictionary的key
            if key not in mp:
                mp[key] = []
            
            mp[key].append(ele)

        return list(mp.values())

