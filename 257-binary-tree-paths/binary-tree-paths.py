# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def binaryTreePaths(self, root: Optional[TreeNode]) -> List[str]:
        res = []
        s = ""

        def dfs(node):
            nonlocal s
            prev_len = len(s)
            if node:
                s += str(node.val)
            else:
                return

            if node.left or node.right:
                s += "->"
            else:
                res.append(s)

            dfs(node.left)
            dfs(node.right)
            s = s[:prev_len]

        
        dfs(root)

        return res