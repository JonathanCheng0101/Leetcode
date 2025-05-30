# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def sumEvenGrandparent(self, root: Optional[TreeNode]) -> int:
        total = 0

        def dfs(node):
            nonlocal total
            if not node:
                return 

            if node.val & 1 == 0:
                if node.left:
                    if node.left.left:
                        total += node.left.left.val
                    if node.left.right:
                        total += node.left.right.val
                if node.right:
                    if node.right.left:
                        total += node.right.left.val
                    if node.right.right:
                        total += node.right.right.val

            dfs(node.left)
            dfs(node.right)

        dfs(root)
        return total
        