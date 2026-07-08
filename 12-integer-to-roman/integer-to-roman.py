class Solution:
    def intToRoman(self, num: int) -> str:
        res = ""
        d = {
            'I': 1,
            'V': 5,
            'X': 10,
            'L': 50,
            'C': 100,
            'D': 500,
            'M': 1000
        }

        d = sorted(d.items(), key = lambda x: -x[1])

        for char, val in d:
            if str(num)[0] == "4":
                n = len(str(num))
                if n == 1:
                    res += "IV"
                    num -= 4
                elif n == 2:
                    res += "XL"
                    num -= 40
                elif n == 3:
                    res += "CD"
                    num -= 400


            elif str(num)[0] == "9":
                n = len(str(num))
                if n == 1:
                    res += "IX"
                    num -= 9
                elif n == 2:
                    res += "XC"
                    num -= 90
                elif n == 3:
                    res += "CM"
                    num -= 900

            else:
                if num < val:
                    continue
            
                res += (num // val) * char

                num -= (num // val) * val
        
        return res

