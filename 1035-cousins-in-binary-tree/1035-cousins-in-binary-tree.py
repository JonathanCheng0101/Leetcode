# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
from collections import deque
class Solution:
    def isCousins(self, root: Optional[TreeNode], x: int, y: int) -> bool:
        # DFS


        def dfs(node, num, parent, level,res):
            if not node:
                return 
            

            if node.val == num:
                res.append(parent)
                res.append(level)
            parent = node.val
            level += 1

            dfs(node.left, num, parent, level,res)
            dfs(node.right, num, parent, level,res)

        res1, res2 = [], []
        dfs(root, x, -1, 0, res1)
        dfs(root, y, -1, 0, res2)
        return (res1[0] != res2[0]) and (res1[1] == res2[1])

        

            