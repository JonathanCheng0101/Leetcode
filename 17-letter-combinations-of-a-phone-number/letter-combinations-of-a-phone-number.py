class Solution:
    def letterCombinations(self, digits: str) -> List[str]:
        res = []
        if not digits:
            return []

        number_dict = {"2": "abc",
                        "3": "def",
                        "4": "ghi",
                        "5": "jkl",
                        "6": "mno",
                        "7": "pqrs",
                        "8": "tuv",
                        "9": "wxyz"}

        def dfs(start_index, path):
            if start_index == len(digits):
                res.append("".join(path))
                return

            next_number = digits[start_index]

            for letter in number_dict[next_number]:
                path.append(letter)
                dfs(start_index + 1, path)
                path.pop()

        dfs(0, [])

        return res






        
        