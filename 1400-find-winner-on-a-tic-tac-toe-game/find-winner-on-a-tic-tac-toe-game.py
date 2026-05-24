class Solution:
    def tictactoe(self, moves: List[List[int]]) -> str:
        a_move, b_move = [], []
        for i, move in enumerate(moves):
            if i % 2 == 0:
                a_move.append(move)
            else:
                b_move.append(move)

        # chk a, b wins
        def check_win(moves):
            moves = set(map(tuple, moves))

            # rows
            for r in range(3):
                if all((r,c) in moves for c in range(3)):
                    return True

            # 
            for c in range(3):
                if all((r,c) in moves for r in range(3)):
                    return True

            #
            if all((i, i) in moves for i in range(3)):
                return True

            # diagonal 右上到左下
            if all((i, 2 - i) in moves for i in range(3)):
                return True

            return False

        # a = True--> a wins--> "A"
        if check_win(a_move):
            return "A"
        # b = True --> b wins --> "B"
        if check_win(b_move):
            return "B"
        # both False chk length, if < 9 --> "Pending"
        if not check_win(a_move) and not check_win(b_move) and (len(a_move) + len(b_move)) < 9:
            return "Pending"
        # both False chk length, if == 9 --> "Draw"
        if not check_win(a_move) and not check_win(b_move) and (len(a_move) + len(b_move)) == 9:
            return "Draw"


        