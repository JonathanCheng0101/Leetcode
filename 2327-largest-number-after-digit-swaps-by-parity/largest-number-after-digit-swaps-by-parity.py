class Solution:
    def largestInteger(self, num: int) -> int:
        odd_index = []
        odd_num = []
        even_index = []
        even_num = []
        for i, char in enumerate(str(num)):
            if int(char) % 2 == 1: # odd
                odd_index.append(i)
                odd_num.append(int(char))
            else: # even
                even_index.append(i)
                even_num.append(int(char))

        odd_num.sort(reverse=True)
        even_num.sort(reverse=True)
        zipped_odd = zip(odd_index, odd_num) 
        zipped_even = zip(even_index, even_num)

        res = [""] * len(str(num))
        for i, num in zipped_odd:
            res[i] = str(num)
        for i, num in zipped_even:
            res[i] = str(num)
        new_ans = "".join(res)
        return int(new_ans)
        

