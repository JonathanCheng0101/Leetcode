# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
from collections import deque
class Solution:
    def findTarget(self, root: Optional[TreeNode], k: int) -> bool:
        q = deque([root])
        res = []

        while q:
            length = len(q)

            for _ in range(length):
                node = q.popleft()
                target = k - node.val
                if target in res:
                    return True
                else:
                    res.append(node.val)                

                if node.left:
                    q.append(node.left)
                if node.right:
                    q.append(node.right)
        return False

        