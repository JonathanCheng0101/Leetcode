class Node:
    def __init__(self, key=0, value=0):
        self.key = key
        self.value = value
        self.prev = None
        self.next = None


class LRUCache:

    def __init__(self, capacity: int):
        self.capacity = capacity
        self.storage = {}

        self.head = Node()
        self.tail = Node()

        self.head.next = self.tail
        self.tail.prev = self.head

    def remove(self, node):
        node.prev.next = node.next
        node.next.prev = node.prev

    def add_to_end(self, node):
        prev_node = self.tail.prev

        prev_node.next = node
        node.prev = prev_node

        node.next = self.tail
        self.tail.prev = node

    def get(self, key: int) -> int:
        if key not in self.storage:
            return -1

        node = self.storage[key]

        self.remove(node)
        self.add_to_end(node)

        return node.value

    def put(self, key: int, value: int) -> None:
        if key in self.storage:
            node = self.storage[key]
            node.value = value

            self.remove(node)
            self.add_to_end(node)

        else:
            if len(self.storage) == self.capacity:
                oldest = self.head.next
                self.remove(oldest)
                del self.storage[oldest.key]

            node = Node(key, value)
            self.storage[key] = node
            self.add_to_end(node)