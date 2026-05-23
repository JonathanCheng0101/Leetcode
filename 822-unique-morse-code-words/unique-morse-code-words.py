class Solution:
    def uniqueMorseRepresentations(self, words: List[str]) -> int:
        chk_table = [".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."]

        
        set_wrd = set()
        for wrd in words:
            cur = ""
            for s in wrd:
                cur += chk_table[ord(s)- ord('a')]

            if cur in set_wrd:
                continue
            else:
                set_wrd.add(cur)
            

        return len(set_wrd)
            