# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

class Solution:
    def inorderSuccessor(self, root: TreeNode, p: TreeNode) -> Optional[TreeNode]:
        successor = None
        def dfs(node):
            nonlocal successor
            if not node:
                return 

            if node.val > p.val:
                successor = node

                dfs(node.left)
            else:
                dfs(node.right)


        dfs(root)

        return successor

        