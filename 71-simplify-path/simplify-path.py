class Solution:
    def simplifyPath(self, path: str) -> str:
        res = path.split("/")

        final = []
        for ele in res:
            if ele == "..":
                if final:
                    final.pop()
            elif ele == "." or ele == "":
                continue
            else:
                final.append(ele)

        return "/"+ "/".join(final)
        
        