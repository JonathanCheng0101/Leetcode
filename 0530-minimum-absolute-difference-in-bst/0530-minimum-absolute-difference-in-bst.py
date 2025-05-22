# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
from collections import deque
class Solution:
    def getMinimumDifference(self, root: Optional[TreeNode]) -> int:
        res = []

        q = deque([root])

        while q:
            length = len(q)
            for _ in range(length):
                node = q.popleft()
                res.append(node.val)

                if node.left:
                    q.append(node.left)
                if node.right:
                    q.append(node.right)
        
        res.sort()
        min_diff = float('inf')
        for i in range(1, len(res)):
            curr_diff = res[i] - res[i - 1]
            min_diff = min(curr_diff, min_diff)

        return min_diff

        