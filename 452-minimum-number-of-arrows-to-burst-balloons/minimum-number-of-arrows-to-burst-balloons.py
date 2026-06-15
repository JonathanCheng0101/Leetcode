class Solution:
    def findMinArrowShots(self, points: List[List[int]]) -> int:
        res = []
        points = sorted(points, key = lambda x:(x[0], x[1]))
        print(points)


        for ele in points:
            if not res:
                res.append(ele)

            else:
                if res[-1][1] < ele[0]:
                    # no overlap
                    res.append(ele)
                else:
                    # yes overlap
                    res[-1][0] = max(res[-1][0], ele[0])
                    res[-1][1] = min(res[-1][1], ele[1])
            
        return len(res)


        