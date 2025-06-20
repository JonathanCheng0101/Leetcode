class Solution:
    def kthSmallest(self, matrix: list, k: int) -> int:
        res = []
        heap = []
        for i in range(len(matrix)):
            heappush(heap, [matrix[i][0],0, i])
        
        for _ in range(k):
            num,cur, i = heappop(heap)
            res.append(num)
            if cur + 1 < len(matrix[i]):
                heappush(heap, [matrix[i][cur + 1], cur + 1, i])

        return res[-1]

        

        
        