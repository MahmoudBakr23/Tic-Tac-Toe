#!/usr/bin/env ruby

puts "player 1's name ..."
player_1 = gets.chomp
puts
puts "player 2's name ..."
player_2 = gets.chomp
puts

puts "#{player_1} is X"
puts "#{player_2} is O"
puts

board = [[1,2,3], [4,5,6], [7,8,9]]

def mark_on_board(board_array, move, player_mark)
  (0..board_array.length-1).each do |i|
    (0..board_array.length-1).each do |j|
      if board_array[i][j] == move
        board_array[i][j] = player_mark
      end
    end
  end
  board_array
end

def display_board(board)
  (0..board.length - 1).each do |i|
    (0..board.length - 1).each do |j|
      print board[i][j].to_s + " "
    end
    puts
  end
  puts
end

display_board(board)

move_counter = 1

while move_counter < 10
  if move_counter.odd?
    puts "#{player_1}'s move"
    move = gets.chomp.to_i
    board = mark_on_board(board, move, "X")
  else
    puts "#{player_2}'s move"
    move = gets.chomp.to_i
    board = mark_on_board(board, move, "O")
  end
  display_board(board)
  move_counter+=1
end 
