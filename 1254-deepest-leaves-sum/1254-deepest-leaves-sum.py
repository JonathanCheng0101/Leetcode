# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
from collections import deque
class Solution:
    def deepestLeavesSum(self, root: Optional[TreeNode]) -> int:
        res = []
        cnt = 0
        q = deque([root])

        while q:

            length = len(q)

            for _ in range(length):
                node = q.popleft()
                cnt += node.val

                if node.left:
                    q.append(node.left)
                if node.right:
                    q.append(node.right)
                
            res.append(cnt)
            cnt = 0

        return res[-1]
        