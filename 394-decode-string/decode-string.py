class Solution:
    def decodeString(self, s: str) -> str:
        res = []
        cur_str = ""
        cur_num = 0

        for char in s:

            if char.isdigit():
                cur_num = 10* cur_num + int(char)
            
            elif char == "[":
                res.append((cur_str, cur_num))
                cur_str = ""
                cur_num = 0

            elif char =="]":
                prev_str, num = res.pop()
                cur_str = prev_str + cur_str * num

            else:
                cur_str += char

        return cur_str
