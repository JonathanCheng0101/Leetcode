"""
# Definition for a Node.
class Node:
    def __init__(self, val: Optional[int] = None, children: Optional[List['Node']] = None):
        self.val = val
        self.children = children
"""
from collections import deque
class Solution:
    def maxDepth(self, root: 'Node') -> int:
        if not root:
            return 0
        res = 0

        q = deque([root])

        while q:
            length = len(q)

            for _ in range(length):
                node = q.popleft()

                if node and node.children:
                    for i in node.children:
                        q.append(i)
            res += 1 

        return res
        