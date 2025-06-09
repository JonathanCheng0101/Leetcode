class Solution:
    def partition(self, s: str) -> List[List[str]]:
        res = []
        n = len(s)

        def palindrone(word):
            return word == word[::-1]

        def dfs(start, path):
            if start == n:
                res.append(path[:])
                return

            for end in range(start + 1, n + 1):
                prefix = s[start: end]

                if palindrone(prefix):
                    path.append(prefix)

                    dfs(end, path)

                    path.pop()

        dfs(0, [])

        return res


        