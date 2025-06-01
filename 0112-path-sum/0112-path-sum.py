# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def hasPathSum(self, root: Optional[TreeNode], targetSum: int) -> bool:

        def dfs(node, total):
            if not node:
                return False

            total += node.val

            if not node.left and not node.right:
                if total == targetSum:
                    return True
            
            dfs_left = dfs(node.left,total)
            dfs_right = dfs(node.right,total)

            return dfs_left or dfs_right

        return dfs(root, 0)

    




                

            

            
