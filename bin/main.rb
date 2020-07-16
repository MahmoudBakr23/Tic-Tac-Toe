#!/usr/bin/env ruby

puts "player one's name ..."
player_one = gets.chomp
puts
puts "player two's name ..."
player_two = gets.chomp
puts

puts "#{player_one} is X"
puts "#{player_two} is O"
puts

board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

def mark_on_board(board_array, move, player_mark)
  (0..board_array.length - 1).each do |i|
    (0..board_array.length - 1).each do |j|
      board_array[i][j] = player_mark if board_array[i][j] == move
    end
  end
  board_array
end

def display_board(board)
  (0..board.length - 1).each do |i|
    (0..board.length - 1).each do |j|
      print board[i][j].to_s + ' '
    end
    puts
  end
  puts
end

display_board(board)

move_counter = 1

def valid_number(move)
  while move.nil? || move.to_i < 1 || move.to_i > 9
    puts 'Please insert a valid number (1-9)'
    move = gets.chomp.to_i
  end
  move
end

while move_counter < 10
  if move_counter.odd?
    puts "#{player_one}'s move"
    move = gets.chomp.to_i
    move = valid_number(move)
    board = mark_on_board(board, move, 'X')
  else
    puts "#{player_two}'s move"
    move = gets.chomp.to_i
    move = valid_number(move)
    board = mark_on_board(board, move, 'O')
  end
  display_board(board)
  move_counter += 1
end
