from heapq import heapify, heappop, heappush
from collections import defaultdict

class Solution:
    def highFive(self, items: List[List[int]]) -> List[List[int]]:

        scores = defaultdict(list)
        for student_id, score in items:
            heappush(scores[student_id], -score)  #如果scores[student_id]不存在，defaultdict會自動產生由他#為key的list這是defaultdict的功用

        res = []

        for student_id in scores:
            total = 0

            for _ in range(5):
                total += -heappop(scores[student_id])
                avg = total // 5
            res.append([student_id, avg])

        res.sort(key = lambda x: x[0])

        return res