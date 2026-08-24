class ListNode:
    def __init__(self, val):
        self.val = val
        self.next = None
        self.prev = None


class MyCircularQueue:

    def __init__(self, k: int):
        self.space = k
        self.size = 0

        self.left = ListNode(0)
        self.right = ListNode(0)
        self.left.next = self.right
        self.right.prev = self.left

    def enQueue(self, value: int) -> bool:
        if self.isFull():
            return False
        
        node = ListNode(value)
        next_node = self.left.next

        self.left.next = node
        node.prev = self.left

        node.next = next_node
        next_node.prev = node   

        self.space -= 1     

        return True        

    def deQueue(self) -> bool:
        if self.isEmpty():
            return False
        
        cur = self.right.prev
        prev_node = self.right.prev.prev

        self.right.prev = prev_node
        prev_node.next = self.right   

        self.space += 1     

        return True        

    def Front(self) -> int:
        if self.isEmpty():
            return -1
        
        return self.right.prev.val
        
    def Rear(self) -> int:
        if self.isEmpty():
            return -1
        
        return self.left.next.val        

    def isEmpty(self) -> bool:
        return self.left.next == self.right
        
    def isFull(self) -> bool:
        return self.space == 0

# Your MyCircularQueue object will be instantiated and called as such:
# obj = MyCircularQueue(k)
# param_1 = obj.enQueue(value)
# param_2 = obj.deQueue()
# param_3 = obj.Front()
# param_4 = obj.Rear()
# param_5 = obj.isEmpty()
# param_6 = obj.isFull()