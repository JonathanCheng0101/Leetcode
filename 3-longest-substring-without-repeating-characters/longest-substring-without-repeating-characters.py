class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        left, right = 0, 0
        res = set()
        cnt = 0
        for ele in s:
            if ele not in res:
                res.add(ele)
                right += 1
            else:
                right += 1
                while ele in res:
                    res.remove(s[left])
                    left += 1
                res.add(ele)
            cnt = max(cnt, right - left)
        return cnt


