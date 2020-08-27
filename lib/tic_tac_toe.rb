board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    false
  else
    true
  end
end

def valid_move?(board, index)
  if index.between?(0, 8) && !position_taken?(board, index)
    true
  else
    false
  end
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, user)
  board[index] = user
end

def play(board)
  counter = 0
  while counter < 9
  turn(board)
  counter += 1
end
end

def turn(board)
  puts "Please put number 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
    user = current_player
    move(index, current_player)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |spot|
    if spot == "X" || spot == "O"
      counter += 1
    end
  end
  counter
end

def current_player(board)
  turn_count(board) % 2 == 0? "X" : "O"
end


WIN_COMBINATIONS = [
  [0, 1, 2], # top row wins
  [3, 4, 5], # middle row wins
  [6, 7, 8], # bottom row wins
  [0, 3, 6], # left column wins
  [1 ,4, 7], # middle column wins
  [2, 5, 8], # right column wins
  [0, 4, 8], # left diagonal wins
  [2, 4, 6]  # right diagonal wins
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0] # grab each index from each win_combination [child array]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    
    position_1 = board[win_index_1] # load the value onto the board
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    
  if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    else 
    end
  end 
  return false
end

def full?(board)
  board.all? do |space|
    space == "X" || space == "O"
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  elsif won?(board) && !full?(board)
    return false
  else
    return false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  end
end

def winner(board)
  winner_index = won?(board)
  if won?(board) 
    return board[winner_index[0]] 
  end
end