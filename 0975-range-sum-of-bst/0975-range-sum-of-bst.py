# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
from collections import deque
class Solution:
    def rangeSumBST(self, root: Optional[TreeNode], low: int, high: int) -> int:
        total = 0
        q = deque([root])

        while q:
            length = len(q)

            for _ in range(length):
                node = q.popleft()
                if node.val >= low and node.val <= high:
                    total += node.val


                if node.left:
                    q.append(node.left)
                if node.right:
                    q.append(node.right)
        return total

        """def dfs(node):
            nonlocal total
            if not node:
                return

            dfs(node.left)
            dfs(node.right)
            if node.val >= low and node.val <= high:
                    total += node.val
            
        
        dfs(root)
        return total"""

            
        