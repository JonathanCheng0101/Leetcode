# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def countUnivalSubtrees(self, root: Optional[TreeNode]) -> int:
        cnt = 0

        def dfs(node):
            nonlocal cnt
            if not node:
                return True

            if not node.left and not node.right: # leaf
                cnt += 1     
                return True

            left_dfs = dfs(node.left)   
            right_dfs = dfs(node.right)

            if not (left_dfs and right_dfs):
                return False
            if node.left and not node.val == node.left.val:
                return False

            if node.right and not node.val == node.right.val:
                return False

            cnt += 1
            return True



        dfs(root)
        return cnt
        