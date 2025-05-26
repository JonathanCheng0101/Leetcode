# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def findSecondMinimumValue(self, root: Optional[TreeNode]) -> int:
        res = []

        def dfs(node):
            if not node:
                return 
            
            if node.val not in res:
                res.append(node.val) 

            dfs(node.left)
            dfs(node.right)
        
        dfs(root)

        sorted_lst = sorted(res)
        return sorted_lst[1] if len(sorted_lst)> 1 else -1
        