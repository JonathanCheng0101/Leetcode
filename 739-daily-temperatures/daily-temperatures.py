class Solution:
    def dailyTemperatures(self, temperatures: List[int]) -> List[int]:
        res = [0] * len(temperatures)
        temp = [] # 存index

        for i, cur_temperature in enumerate(temperatures):
            while temp and cur_temperature > temp [-1][1]:
                prev_index, prve_temperature = temp.pop()
                res[prev_index] = i - prev_index

            temp.append((i,cur_temperature))
        
        return res
                




        