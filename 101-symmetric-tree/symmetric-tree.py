# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def isSymmetric(self, root: Optional[TreeNode]) -> bool:
        
        def dfs(node,lst,chk):
            if not node:
                lst.append(None)
                return 
            lst.append(node.val)
            if chk== 1:
                dfs(node.left, lst, chk)
                dfs(node.right, lst, chk)
            else:
                dfs(node.right, lst, chk)
                dfs(node.left, lst, chk)


            
        res1, res2 = [], []
        dfs(root.left, res1, 1)
        dfs(root.right, res2, 0)
        return res1 == res2