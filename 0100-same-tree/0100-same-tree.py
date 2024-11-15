# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def isSameTree(self, p: Optional[TreeNode], q: Optional[TreeNode]) -> bool:
        if not p and not q:
            return True
        elif not p or not q:
            return False
        elif p.val != q.val:
            return False

        # this is to examine both the left and right child of the root, and the left child will also chk his left and right child
        return (self.isSameTree(p.left, q.left) and 
        self.isSameTree(p.right, q.right))

        


        