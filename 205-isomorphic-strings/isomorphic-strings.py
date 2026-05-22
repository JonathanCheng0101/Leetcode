class Solution:
    def isIsomorphic(self, s: str, t: str) -> bool:
        def encode(w):
            w_dict = {}
            res = []
            for i,ele in enumerate(w):
                if ele not in w_dict:
                    w_dict[ele] = i
                res.append(w_dict[ele])
            return res

        return encode(s) == encode(t)