# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def sumNumbers(self, root: Optional[TreeNode]) -> int:
        if not root:
            return 0
        total = 0
        res, temp_lst = [], []

        def dfs(node):
            if not node:
                return 

            temp_lst.append(str(node.val))

            if not node.left and not node.right: # leaf node
                res.append("".join(temp_lst))  
                temp_lst.pop()
                return  # !!!!important

            dfs(node.left)
            dfs(node.right)
            temp_lst.pop()


        dfs(root)
        for ele in res: 
            total += int(ele)

        return total     