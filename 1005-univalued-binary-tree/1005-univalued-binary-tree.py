# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
from collections import deque
class Solution:
    def isUnivalTree(self, root: Optional[TreeNode]) -> bool:
        cur_num = root.val
        q = deque([root])

        while q:
            length = len(q)

            for _ in range(length):
                node = q.popleft()
                if node.val != cur_num:
                    return False

                if node.left:
                    q.append(node.left)
                if node.right:
                    q.append(node.right)

        return True