"""
# Definition for a Node.
class Node:
    def __init__(self, val: int = 0, left: 'Node' = None, right: 'Node' = None, next: 'Node' = None):
        self.val = val
        self.left = left
        self.right = right
        self.next = next
"""
from collections import deque
class Solution:
    def connect(self, root: 'Optional[Node]') -> 'Optional[Node]':
        if not root:   
            return None
        q = deque([root])

        while q:
            length = len(q)
            prev = None


            for _ in range(length):
                node = q.popleft()
                if prev:
                    prev.next = node #宣告3為prev.next，因為新的node = q.popleft()已經產生
                prev = node    # 2

                if node.left:
                    q.append(node.left)
                if node.right:
                    q.append(node.right)

            prev.next = None

        return root

        