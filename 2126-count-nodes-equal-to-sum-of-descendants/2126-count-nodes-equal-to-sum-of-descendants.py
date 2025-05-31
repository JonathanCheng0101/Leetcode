# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def equalToDescendants(self, root: Optional[TreeNode]) -> int:
        cnt = 0

        def dfs(node,total):
            nonlocal cnt
            if not node:
                return 0
            
            left_sum = dfs(node.left, total)
            right_sum = dfs(node.right, total)

            total = left_sum + right_sum

            if total == node.val:
                cnt += 1

            return total + node.val

        dfs(root, 0)

        return cnt





        