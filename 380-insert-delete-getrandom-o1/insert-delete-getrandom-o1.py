import random
class RandomizedSet:

    def __init__(self):
        self.d = {}
        self.lst = []        

    def insert(self, val: int) -> bool:
        res = val not in self.d
        if res:
            self.d[val] = len(self.lst)
            self.lst.append(val)

        return res

    def remove(self, val: int) -> bool:
        res = val in self.d
        if res:
            # get index in lst
            ind = self.d[val]
            # get last_val
            last_val = self.lst[-1]
            # 覆蓋 lst
            self.lst[ind] = last_val
            self.lst.pop()
            # 更改d
            self.d[last_val] = ind
            del self.d[val]

        return res        

    def getRandom(self) -> int:
        return random.choice(self.lst)
        


# Your RandomizedSet object will be instantiated and called as such:
# obj = RandomizedSet()
# param_1 = obj.insert(val)
# param_2 = obj.remove(val)
# param_3 = obj.getRandom()