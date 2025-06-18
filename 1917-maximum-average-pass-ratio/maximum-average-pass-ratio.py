from heapq import heapify, heappop, heappush
class Solution:
    def maxAverageRatio(self, classes: List[List[int]], extraStudents: int) -> float:

        def gain(p, t):
            return ((p+1)/(t+1)) - p/t

        new_lst = [[-gain(p,t), p, t] for p, t in classes]
        heapify(new_lst)

        res = 0

        for _ in range(extraStudents):
            _, p, t = heappop(new_lst)
            p += 1
            t += 1
            heappush(new_lst, [-gain(p,t), p, t])

        return (sum(p / t for _, p, t in new_lst))/len(new_lst)