# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def isSameTree(self, p: Optional[TreeNode], q: Optional[TreeNode]) -> bool:
        resp = []
        resq = []

        def dfs(node, res):
            if not node:
                res.append(None)
                return 

            res.append(node.val)
            dfs(node.left, res)
            dfs(node.right, res)

        dfs(p, resp)
        dfs(q, resq)

        return resp == resq
        