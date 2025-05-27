# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def averageOfSubtree(self, root: TreeNode) -> int:
        res = []
        cnt = 0

        def dfs(node):
            nonlocal cnt
            if not node:   # edge case 1  empty node
                return (0, 0)

            if not node.left and not node.right:  # leaf node
                cnt += 1
                return (node.val, 1)  # (current sum, current count()

            left_sum, left_count = dfs(node.left)
            right_sum, right_count = dfs(node.right)

            cur_avg = (left_sum + right_sum + node.val ) //(left_count + right_count + 1)
            if cur_avg == node.val:
                cnt += 1

            return (left_sum + right_sum + node.val, left_count + right_count + 1)

        dfs(root)

        return cnt

        