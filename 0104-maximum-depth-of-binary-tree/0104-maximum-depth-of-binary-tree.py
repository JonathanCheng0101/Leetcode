# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right

#class Solution:
#    def maxDepth(self, root: Optional[TreeNode]) -> int:
#        if not root:
#            return 0

#        return (1 + max(self.maxDepth(root.left),self.maxDepth(root.right)))


from collections import deque
class Solution:
    def maxDepth(self, root: Optional[TreeNode]) -> int:
        if not root:
            return 0

        cnt = 0

        q = deque([root])

        while q:
            length = len(q)

            for _ in range(length):

                node = q.popleft()

                if node.left:
                    q.append(node.left)

                if node.right:
                    q.append(node.right)
            
            cnt += 1

        return cnt
            
 
        




    
        