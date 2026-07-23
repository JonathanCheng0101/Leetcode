class Solution:
    def wordPattern(self, pattern: str, s: str) -> bool:
        p_lst = list(pattern)
        s_lst = s.split(' ')
        if len(s_lst) != len(p_lst):
            return False
        
        d = {}
        for i in range(len(p_lst)):
            if p_lst[i] not in d:
                d[p_lst[i]] = s_lst[i]
            else:
                if d[p_lst[i]] != s_lst[i]:
                    return False
        
        t = {}
        for i in range(len(s_lst)):
            if s_lst[i] not in t:
                t[s_lst[i]] = p_lst[i]
            else:
                if t[s_lst[i]] != p_lst[i]:
                    return False
            
        
        return True
        
                
