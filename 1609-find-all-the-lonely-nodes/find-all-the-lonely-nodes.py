# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
from collections import deque
class Solution:
    def getLonelyNodes(self, root: Optional[TreeNode]) -> List[int]:
        if not root:
            return []
        
        res = []
        q = deque([root])

        while q:
            length = len(q)
            for _ in range(length):

                node = q.popleft()
                if node.left and node.right:
                    q.append(node.left)
                    q.append(node.right)

                elif node.left and not node.right:
                    q.append(node.left)
                    res.append(node.left.val)
                elif node.right and not node.left:
                    q.append(node.right)
                    res.append(node.right.val)

        return res

