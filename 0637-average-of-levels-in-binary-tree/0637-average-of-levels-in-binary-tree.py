# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
from collections import deque
class Solution:
    def averageOfLevels(self, root: Optional[TreeNode]) -> List[float]:
        res = []
        q = deque([root])

        while q:
            length = len(q)
            curr_sum = 0
            cnt = 0
            for _ in range(length):
                node = q.popleft()
                cnt += 1
                
                curr_sum += node.val

                if node.left:
                    q.append(node.left)
        
                if node.right:
                    q.append(node.right)
            
            res.append(curr_sum / cnt)

        return res