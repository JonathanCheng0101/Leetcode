# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def findMode(self, root: Optional[TreeNode]) -> List[int]:
        freq = {}

        def dfs(node):
            if not node:
                return
            freq[node.val] =  1 + freq.get(node.val,0)

            if node.left:
                dfs(node.left)
            if node.right:
                dfs(node.right)

        
        dfs(root)
        max_value = max(freq.values())

        modes = [key for key,value in freq.items() if value == max_value]
        return modes

        

        



        