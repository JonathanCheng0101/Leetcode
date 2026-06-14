
class Solution:
    def minMeetingRooms(self, intervals: List[List[int]]) -> int:
        final = []
        res = []

        intervals = sorted(intervals, key = lambda x: x[0])

       
        for ele in intervals:
            ok = False
            if not res:
                res.append(ele)
                final.append(res)
            else:
                for lst in final:
                    if ele[0] >= lst[-1][1]:
                        # ok 直接加入
                        lst.append(ele)
                        ok = True
                        break
                if not ok:
                    final.append([ele])

        return len(final)



                
                                

            

        