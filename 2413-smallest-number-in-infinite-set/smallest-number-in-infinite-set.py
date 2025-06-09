from heapq import heapify, heappop, heappush
class SmallestInfiniteSet:

    def __init__(self):
        self.heap = list(range(1, 1001))
        heapify(self.heap)
        self.heap_set = set(self.heap)
        

    def popSmallest(self) -> int:
        if self.heap:
            smallest = heappop(self.heap)
            self.heap_set.remove(smallest)
        
            return smallest        
        

    def addBack(self, num: int) -> None:
        if num not in self.heap_set:
            heappush(self.heap, num)
            self.heap_set.add(num)
        


# Your SmallestInfiniteSet object will be instantiated and called as such:
# obj = SmallestInfiniteSet()
# param_1 = obj.popSmallest()
# obj.addBack(num)