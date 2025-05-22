# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
from collections import deque
class Solution:
    def maxLevelSum(self, root: Optional[TreeNode]) -> int:
        q = deque([root])
        level = 1
        max_val = float('-inf')

        while q:
            level_sum = 0

            length = len(q)

            for _ in range(length):
                node = q.popleft()
                level_sum += node.val

                if node.left:
                    q.append(node.left)
                if node.right:
                    q.append(node.right)
                
            if level_sum > max_val:
                max_val = level_sum
                max_level = level
            level += 1

        return max_level


     








        