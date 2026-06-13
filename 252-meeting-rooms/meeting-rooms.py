class Solution:
    def canAttendMeetings(self, intervals: List[List[int]]) -> bool:
        lst = sorted(intervals, key = lambda x:x[0])
        for i in range(len(lst) - 1):
            cur = lst[i]
            nxt = lst[i + 1]

            if cur[1] > nxt[0]:
                return False

        return True
            

        