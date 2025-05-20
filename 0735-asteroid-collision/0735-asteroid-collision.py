import math
class Solution:
    def asteroidCollision(self, asteroids: List[int]) -> List[int]:
        res = []

        for asteroid in asteroids:
            if res == []:
                res.append(asteroid)
            else:
                alive = True
                while res and alive and (asteroid < 0 and res[-1] > 0) :
                    if abs(asteroid) == abs(res[-1]):   # loop over
                        res.pop()
                        alive = False
                        break

                    elif abs(asteroid) > abs(res[-1]): # old star explode, keep moving backwards
                        res.pop()

                    else:                              # new star explode,           
                        alive= False
                        break
                        

                    
                if alive:
                    res.append(asteroid)

        return res


        