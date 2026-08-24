class Node:
    def __init__(self, key = 0, value = 0):
        self.key = key
        self.val = value
        self.prev = None
        self.nxt = None

class LRUCache:

    def __init__(self, capacity: int):
        self.capacity = capacity
        self.cache = {}

        self.left = Node()
        self.right = Node()

        self.left.next = self.right
        self.right.prev = self.left
    
    def remove(self, node):
        prev_node = node.prev
        nxt_node = node.next

        prev_node.next = nxt_node
        nxt_node.prev = prev_node
    
    def add_to_end(self, node):
        prev_node = self.right.prev
        
        prev_node.next = node
        node.prev = prev_node

        node.next = self.right
        self.right.prev = node        

    def get(self, key: int) -> int:
        if key not in self.cache:
            return -1
        
        # cache hit --> update linked list
        node = self.cache[key]
        res = node.val
        self.remove(node)
        self.add_to_end(node)

        return res
        
    def put(self, key: int, value: int) -> None:
        if key in self.cache:
            node = self.cache[key]
            node.val = value

            self.remove(node)
            self.add_to_end(node)
        
        else:
            node = Node(key, value)
            self.cache[key] = node
            self.add_to_end(node)

            if len(self.cache) > self.capacity:
                lru = self.left.next
                self.remove(lru)
                del self.cache[lru.key]


        


# Your LRUCache object will be instantiated and called as such:
# obj = LRUCache(capacity)
# param_1 = obj.get(key)
# obj.put(key,value)