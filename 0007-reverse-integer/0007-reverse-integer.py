class Solution:
    def reverse(self, x: int) -> int:
        if (x > math.pow(2,31) - 1) or (x < math.pow(-2,31)):
            return 0
        if x < 0:
            biggerThanZero = False
            str_x = str(x)[1:]

        else:
            biggerThanZero = True
            str_x = str(x)

        new_x = ""

        for i in range(len(str_x) - 1, -1, -1):
            new_x += str_x[i]
        

        if biggerThanZero: # > 0
            return int(new_x) if int(new_x) < math.pow(2,31) - 1 else 0

        else:
            return (-1)*int(new_x) if (-1)*int(new_x) > math.pow(-2,31) else 0


        
        