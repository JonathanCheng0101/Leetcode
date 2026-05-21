from collections import defaultdict
class Solution:
    def canConstruct(self, ransomNote: str, magazine: str) -> bool:
        # r 是 m 的子集合
        r_dict = defaultdict(int)
        m_dict = defaultdict(int)

        for ele in ransomNote:
            r_dict[ele] += 1

        for ele in magazine:
            m_dict[ele] += 1

        for ele in r_dict:
            if ele not in m_dict:
                return False
            else:
                m_dict[ele] -= r_dict[ele]
        for ele in m_dict:
            if m_dict[ele] < 0:
                return False
        return True