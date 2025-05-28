# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
from collections import deque
class Solution:
    def levelOrderBottom(self, root: Optional[TreeNode]) -> List[List[int]]:
        res = []
        temp_lst = []

        if not root:
            return []

        q = deque([root])
        while q:
            length = len(q)

            for _ in range(length):

                node = q.popleft()
                temp_lst.append(node.val)

                if node.left:
                    q.append(node.left)
                if node.right:
                    q.append(node.right)

            res.append(temp_lst)
            temp_lst = []

        res.reverse()

        return res

                
