class Node:
    def __init__(self, key=0, value=0):
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


    def get(self, key: int) -> int:
        if key not in self.cache:
            return -1

        node = self.cache[key]

        # 把 node 從原本位置拔掉
        node.prev.next = node.next
        node.next.prev = node.prev

        # 放到最前面
        node.next = self.head.next
        node.prev = self.head
        self.head.next.prev = node
        self.head.next = node

        return node.value


    def put(self, key: int, value: int) -> None:
        if key in self.cache:
            # 已存在：先拔掉舊 node
            node = self.cache[key]
            node.prev.next = node.next
            node.next.prev = node.prev
            node.value = value

        else:
            # 不存在：建立新 node
            node = Node(key, value)
            self.cache[key] = node

        # 放到最前面
        node.next = self.head.next
        node.prev = self.head
        self.head.next.prev = node
        self.head.next = node

        # 超過容量 → 刪掉最後一個
        if len(self.cache) > self.capacity:
            lru = self.tail.prev
            lru.prev.next = self.tail
            self.tail.prev = lru.prev
            del self.cache[lru.key]