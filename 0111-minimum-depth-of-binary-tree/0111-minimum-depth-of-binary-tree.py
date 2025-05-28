# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
from collections import deque
class Solution:
    def minDepth(self, root: Optional[TreeNode]) -> int:
        if not root:
            return 0

        min_level = float("inf")

        def dfs(node, level):
            nonlocal min_level
            if not node:
                return 

            level += 1

            # make min value comparison 
            if not node.left and not node.right:
                min_level = min(min_level, level)

            dfs(node.left, level)
            dfs(node.right, level)

        
        dfs(root, 0)

        return min_level




            