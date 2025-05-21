from collections import deque
class RecentCounter:

    def __init__(self):
        self.queue = deque()
        

    def ping(self, t: int) -> int:
        self.queue.append(t)
        cnt = 0
        for time in self.queue:
            if t-3000 <= time:
                cnt += 1

        return cnt
        


# Your RecentCounter object will be instantiated and called as such:
# obj = RecentCounter()
# param_1 = obj.ping(t)