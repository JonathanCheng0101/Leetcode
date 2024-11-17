# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
from collections import deque
class Solution:
    def maxDepth(self, root: Optional[TreeNode]) -> int:
        if not root:
            return 0

        return 1 + max(self.maxDepth(root.left),self.maxDepth(root.right))




        """
        if not root:
            return 0

        queue = deque([root])
        cnt = 0
        while len(queue)>0:
            cnt += 1    #確定有的再加
            n = len(queue)
            for _ in range(n):
                node = queue.popleft()
              
                for child in [node.left, node.right]:
                    if child is not None:
                        queue.append(child)

        return cnt"""
        