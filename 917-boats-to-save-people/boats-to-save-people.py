class Solution:
    def numRescueBoats(self, people: List[int], limit: int) -> int:
        res = 0
        l, r = 0, len(people) - 1
        people = sorted(people)

        while l < r:
            if people[l] + people[r] <= limit:
                res += 1
                l += 1
                r -= 1
            elif people[l] + people[r] > limit:
                res += 1
                r -= 1
        if l > r:
            return res
        return res + 1


            