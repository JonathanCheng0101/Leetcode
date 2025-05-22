# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
from collections import deque
class Solution:
    def levelOrder(self, root: Optional[TreeNode]) -> List[List[int]]:
        if not root:
            return []
        
        res = []
        level_lst = []

        queue = deque([root])

        while queue:
            n= len(queue)
            for _ in range(n):
                node = queue.popleft()
                level_lst.append(node.val)


                if node.left:
                    queue.append(node.left)
                if node.right:
                    queue.append(node.right)

            res.append(level_lst)
            level_lst = []

        return res

        