class Solution:
    def dietPlanPerformance(self, calories: List[int], k: int, lower: int, upper: int) -> int:
        
        res = 0

        window = calories[:k]
        window_sum = sum(window)

        if window_sum > upper:
            res += 1
        elif window_sum < lower:
            res -= 1
        
        for i in range(k, len(calories)):
            window_sum += calories[i]
            window_sum -= calories[i-k]

            if window_sum > upper:
                res += 1
            elif window_sum < lower:
                res -= 1

        return res


        