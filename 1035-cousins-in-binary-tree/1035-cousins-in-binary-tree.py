# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
from collections import deque
class Solution:
    def isCousins(self, root: Optional[TreeNode], x: int, y: int) -> bool:
        if not root:
            return False
        q = deque([root])

        while q:
            length = len(q)

            for _ in range(length):
                node = q.popleft()
                if node and node.left and node.right:
                    if (node.left.val == x and node.right.val == y)or (node.right.val == x and node.left.val == y):
                        return False

                if node.left:
                    q.append(node.left)

                
                if node.right:
                    q.append(node.right)
                
            if any(node.val == x for node in q) and any(node.val == y for node in q): 
                return True
        
        return False

                
                
                
            
        