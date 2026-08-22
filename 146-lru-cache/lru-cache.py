class Node:
    def __init__(self, key= 0, value= 0):
        self.key = key
        self.value = value
        self.prev = None
        self.next = None

class LRUCache:

    def __init__(self, capacity: int):
        self.capacity = capacity
        self.cache = {}

        self.head = Node()
        self.tail = Node()

        self.head.next = self.tail
        self.tail.prev = self.head

    # 把 node 從 Linked List 原本的位置拆掉
    def remove(self, node):
        prev_node = node.prev
        next_node = node.next

        prev_node.next = next_node
        next_node.prev = prev_node
    
    # 把 node 插到 tail 前面，成為最新使用
    def insert(self, node):
        prev_node = self.tail.prev
        
        prev_node.next = node
        node.prev = prev_node

        node.next = self.tail
        self.tail.prev = node

    def get(self, key: int) -> int:
        res = -1
        if key in self.cache:
            node = self.cache[key]


            # remove old
            self.remove(node)
            # insert 
            self.insert(node)
            res = node.value

        return res

    def put(self, key: int, value: int) -> None:
        if key in self.cache:
            node = self.cache[key]
            node.value = value

            self.remove(node) 
            self.insert(node)
        
        else:
            node = Node(key, value)
            self.cache[key] = node
            self.insert(node)

            if len(self.cache) > self.capacity:
                headnode = self.head.next
                self.remove(headnode)

                del self.cache[headnode.key]

# Your LRUCache object will be instantiated and called as such:
# obj = LRUCache(capacity)
# param_1 = obj.get(key)
# obj.put(key,value)