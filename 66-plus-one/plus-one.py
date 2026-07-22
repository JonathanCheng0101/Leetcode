class Solution:
    def plusOne(self, digits: List[int]) -> List[int]:
        new_digit = (str(d) for d in digits)
        num = int("".join(new_digit))
        new_num = str(num + 1)
        new_lst =  list(new_num)
        return [int(num) for num in new_lst]
       