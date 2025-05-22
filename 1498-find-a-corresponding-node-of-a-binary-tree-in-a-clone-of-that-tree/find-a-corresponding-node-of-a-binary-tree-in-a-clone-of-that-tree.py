# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None
from collections import deque
class Solution:
    def getTargetCopy(self, original: TreeNode, cloned: TreeNode, target: TreeNode) -> TreeNode:
        def bfs(node):
            q = deque([node])

            if not node:
                return None

            while q:
                
                length = len(q)

                for _ in range(length):
                    node = q.popleft()
                    if node.val == target.val:
                        return node

                    if node.left:
                        q.append(node.left)
                    if node.right:
                        q.append(node.right)

        
        return bfs(cloned)