# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def searchBST(self, root: Optional[TreeNode], val: int) -> Optional[TreeNode]:
        found = None
        def dfs(node):
            nonlocal found
            if not node or found:
                return 
            
            if node.val == val:
                found = node

            dfs(node.left)
            dfs(node.right)

        
        dfs(root)

        return found
        