board = [['X', 'O', 'O'],
         ['X', 'X', 'O'],
         ['O', 'X', 'O']]

def count_in_row (board, letter)
  board.each_with_index do |m, k|
  counter = 0
  row_counter = 0
    m.each do |n|
      if n.include?(letter)
        counter += 1
      end
    end
  puts "#{counter} '#{letter}'s in row #{k+1}"
  end
end

# Given the last array, write a program that will output an array that looks
# like: [[x1, y1], [x2, y2], ...] where x and y is the row and column of X's moves.

coord_board = [['0,0', '0,1', '0,2'],
               ['1,0', '1,1', '1,2'],
               ['2,0', '2,1', '2,2']]

def xo_coords(board, letter)
  coord_arr = []
  board.each_index do |arr|
    board[arr].each_index do |coord|
      if board[arr][coord] == letter
        coord_arr.push([arr.to_i, coord.to_i])
      end
    end
  end
  coord_arr
end

# returns true if arr_1 contains all the elements that arr_2 contains (can contain more)
def is_subset(arr_1, arr_2)
  (arr_2 - arr_1).empty?
end

def win_condition(board)
  win_conditions = [ [[0,0],[0,1],[0,2]],
                     [[1,0],[1,1],[1,2]],
                     [[2,0],[2,1],[2,2]],
                     [[0,0],[1,0],[2,0]],
                     [[0,1],[1,1],[2,1]],
                     [[0,2],[1,2],[2,2]],
                     [[0,0],[1,1],[2,2]],
                     [[0,2],[1,2],[2,2]] ]

  o_coords = xo_coords(board, "O")
  x_coords = xo_coords(board, "X")

  win_conditions.each do |win|
    o_win = is_subset(o_coords, win)
    x_win = is_subset(x_coords, win)
    if o_win
      puts "O has won with coordinates #{win}"
      break
    end
    if x_win
      puts "x has won with coordinates #{win}"
      break
    end
  end
end

win_condition(board)