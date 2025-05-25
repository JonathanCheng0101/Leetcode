# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def sumRootToLeaf(self, root: Optional[TreeNode]) -> int:
        res = []
        num = ""

            
        def dfs(node):
            nonlocal res, num
            if not node:
                return
            num += str(node.val)
            if not node.left and not node.right:
                res.append(num)
            else:
                dfs(node.left)
                dfs(node.right)
            num = num[:-1]

        def converter(number: str) -> int:
            total = 0
            original = 1
            for i in range(len(number)-1, -1, -1):
                total += int(number[i]) * original
                original *= 2

            return total

        dfs(root)

        return sum(converter(s) for s in res)







        