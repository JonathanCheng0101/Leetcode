import random
class RandomizedSet:

    def __init__(self):
        self.arr = [] #存數字
        self.pos = {} 
        

    def insert(self, val: int) -> bool:
        if val in self.pos:
            return False
        self.pos[val] = len(self.arr)
        self.arr.append(val)
        return True
        

    def remove(self, val: int) -> bool:
        if val not in self.pos:
            return False
        
        index = self.pos[val]
        last_val = self.arr[-1]

        self.arr[index] = last_val
        self.pos[last_val] = index

        # 刪掉最後一格
        self.arr.pop()
        del self.pos[val]

        return True
        

    def getRandom(self) -> int:
        return random.choice(self.arr)
        


# Your RandomizedSet object will be instantiated and called as such:
# obj = RandomizedSet()
# param_1 = obj.insert(val)
# param_2 = obj.remove(val)
# param_3 = obj.getRandom()