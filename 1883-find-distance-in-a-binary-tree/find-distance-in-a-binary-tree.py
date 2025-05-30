# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def findDistance(self, root: Optional[TreeNode], p: int, q: int) -> int:
        res = {}
        
        def dfs(node, path):
            if not node:
                return 
            res[node.val] = path


            dfs(node.left, path + "L")
            dfs(node.right, path + "R")

        dfs(root, "")

        coor1 = res[p]
        coor2 = res[q]

        while coor1 and coor2 and coor1[0] == coor2[0]:
            coor1 = coor1[1:]
            coor2 = coor2[1:]

        return len(coor1) + len(coor2)




        