class Solution:
    def wordPattern(self, pattern: str, s: str) -> bool:
        split_s = s.split(" ")
        def encode(w):
            d = {}
            res_w = []
            for i, ele in enumerate(w):
                if ele not in d:
                    d[ele] = i
                res_w.append(d[ele])
            return res_w
            
        if len(encode(pattern)) != len(encode(split_s)):
            return False

        return encode(pattern) == encode(split_s)
                
                
