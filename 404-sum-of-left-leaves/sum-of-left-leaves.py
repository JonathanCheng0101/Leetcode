# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
from collections import deque
class Solution:
    def sumOfLeftLeaves(self, root: Optional[TreeNode]) -> int:
        res = 0
        sensor = False
        q = deque([root])

        while q:
            length = len(q)

            for _ in range(length):
                node = q.popleft()
                if node.left:
                    if not node.left.left and not node.left.right:
                        res += node.left.val

                if node.left:
                    q.append(node.left)
                if node.right:
                    q.append(node.right)

        return res
        