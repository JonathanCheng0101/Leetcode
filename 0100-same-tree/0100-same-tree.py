# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def isSameTree(self, p: Optional[TreeNode], q: Optional[TreeNode]) -> bool:
        resp, resq = [], []
        
        def dfs(node, lst):
            if not node:
                lst.append(None)
                return

            lst.append(node.val)
            dfs(node.left, lst)
            dfs(node.right, lst)


        dfs(p, resp)
        dfs(q, resq)
        return resp == resq


    