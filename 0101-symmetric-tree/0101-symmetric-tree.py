# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
from collections import deque
class Solution:
    def isSymmetric(self, root: Optional[TreeNode]) -> bool:
        res1, res2 = [], []

        def dfs(node,res,isLeft):
            if not node:
                res.append(None)
                return 
            res.append(node.val)
            
            if isLeft:
                dfs(node.left, res, isLeft)
                dfs(node.right, res, isLeft)
            else:
                dfs(node.right, res, isLeft)
                dfs(node.left, res, isLeft)

        dfs(root.left, res1, True)
        dfs(root.right, res2, False)
        return res1 == res2

            

            
        