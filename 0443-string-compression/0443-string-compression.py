class Solution:
    def compress(self, chars: List[str]) -> int:
        insert = 0    # 要寫在哪裡
        i = 0      # 下一個要觀察的地方

        while i < len(chars):
            group = 1  #同一個字母的count

            while (i + group)< len(chars) and chars[i] ==chars[i + group]:
                group += 1


            chars[insert] = chars[i]
            insert += 1

            if group > 1:
                string = str(group)
                chars[insert: insert + len(string)] =  list(string)

                insert += len(string)
            i += group

        return insert                   




                    


