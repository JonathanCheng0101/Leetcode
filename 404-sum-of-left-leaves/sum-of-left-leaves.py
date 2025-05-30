# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
from collections import deque
class Solution:
    def sumOfLeftLeaves(self, root: Optional[TreeNode]) -> int:
        total = 0

        def dfs(node, left):
            nonlocal total
            if not node:
                return 
            
            dfs(node.left, True)
            dfs(node.right, False)

            if not node.left and not node.right and left:
                total += node.val

        dfs(root, False)
        return total
       
        