# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
from collections import deque
class Solution:
    def averageOfLevels(self, root: Optional[TreeNode]) -> List[float]:
        res = []
        cnt, total = 0, 0
        q = deque([root])

        while q:
            length = len(q)

            for _ in range(length):
                node = q.popleft()
                total += node.val
                cnt += 1

                if node.left:
                    q.append(node.left)
                if node.right:
                    q.append(node.right)

            res.append(total / cnt)
            total = 0
            cnt = 0

        return res

                