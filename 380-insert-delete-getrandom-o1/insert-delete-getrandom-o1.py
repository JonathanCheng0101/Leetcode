import random
class RandomizedSet:

    def __init__(self):
        self.d = {}
        self.lst = []
        

    def insert(self, val: int) -> bool:
        res = val in self.d
        if not res:
            self.d[val] = len(self.lst)
            self.lst.append(val)
        
        return not res        

    def remove(self, val: int) -> bool:
        res = val in self.d
        if res:
            index = self.d[val]
            last_val = self.lst[-1]
            self.lst[index] = last_val
            self.lst.pop()
            self.d[last_val] = index

            del self.d[val]

        return res        

    def getRandom(self) -> int:
        return random.choice(self.lst)
        


# Your RandomizedSet object will be instantiated and called as such:
# obj = RandomizedSet()
# param_1 = obj.insert(val)
# param_2 = obj.remove(val)
# param_3 = obj.getRandom()