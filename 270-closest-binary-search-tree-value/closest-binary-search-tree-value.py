# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def closestValue(self, root: Optional[TreeNode], target: float) -> int:
        res = []

        def dfs(node):
            if not node:
                return
            res.append([node, abs(target - node.val)])
            if target > node.val:
                dfs(node.right)
            else:
                dfs(node.left)
        
        dfs(root)
        #res.sort(key=lambda x: x[1])
        res.sort(key=lambda x: (x[1], x[0].val))
        return res[0][0].val