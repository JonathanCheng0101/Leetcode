class Solution:
    def uniqueOccurrences(self, arr: List[int]) -> bool:
        count = {}

        for i in arr:
            count[i] = 1 + count.get(i, 0)
        
        occur = list(count.values())
        
        return len(occur) == len(set(occur))

        