#!/usr/bin/env ruby

puts "player one's name ..."
name = gets.chomp
player_one = { name: name, mark: 'X' }
puts
puts "player two's name ..."
name = gets.chomp
player_two = { name: name, mark: 'O' }
puts

puts "#{player_one[:name]} is #{player_one[:mark]}"
puts "#{player_two[:name]} is #{player_two[:mark]}"
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

def valid_number(move)
  while move.nil? || move.to_i < 1 || move.to_i > 9
    puts 'Please insert a valid number (1-9)'
    move = gets.chomp.to_i
  end
  move
end

def current_player(player_rate)
  puts "#{player_rate[:name]}'s move"
  move = gets.chomp.to_i
  valid_number(move)
end

def switch_player(player_counter, player_one, player_two)
  if player_counter.zero?
    player_counter += 1
    [player_one, player_counter]
  else
    player_counter = 0
    [player_two, player_counter]
  end
end

def win
  x = rand(0..1)
  return true if x == 1

  false
end

def draw
  x = rand(2..3)
  return true if x == 2

  false
end

move_counter = 1
game = true
player_counter = 0

while game
  player, player_counter = switch_player(player_counter, player_one, player_two)
  current_player(player)
  if win
    puts "#{player[:name]} is winner"
    game = false
  elsif draw
    puts 'Game is draw'
    game = false
  end

  display_board(board)
  move_counter += 1
end
