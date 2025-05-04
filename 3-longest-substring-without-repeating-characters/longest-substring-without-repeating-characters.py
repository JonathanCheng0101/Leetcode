class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        left = 0
        cnt = 0
        counter: dict[str, int] = defaultdict(int)


        for right in range(len(s)):
            counter[s[right]] += 1
            while counter[s[right]] > 1:
                
                counter[s[left]] -= 1
                left += 1

            cnt  = max(cnt, right-left + 1)

        return cnt

        