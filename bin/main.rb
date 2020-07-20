#!/usr/bin/env ruby

require_relative '../lib/player.rb'
require_relative '../lib/board.rb'

puts "player one's name ..."
name = gets.chomp
player_one = Player.new(name, 'X')

puts
puts "player two's name ..."
name = gets.chomp
player_two = Player.new(name, 'O')
puts

puts "#{player_one.name} is #{player_one.mark}"
puts "#{player_two.name} is #{player_two.mark}"
puts

board = Board.new

board.display_board

def valid_number(move)
  while move.nil? || move.to_i < 1 || move.to_i > 9
    puts 'Please insert a valid number (1-9)'
    move = gets.chomp.to_i
  end
  move
end

def check_invalid_slot(move, board)
  while board.booked_slots.any?(move)
    puts 'Please choose another slot'
    move = gets.chomp.to_i
    move = valid_number(move)
  end
  move
end

def switch_user(player_turn, board, move_counter)
  puts "#{player_turn.name}'s move"
  move = gets.chomp.to_i
  move = valid_number(move)
  move = check_invalid_slot(move, board)
  board.booked_slots.push(move)
  board.mark_on_board(move, player_turn.mark)
  if move_counter >= 5 && board.win_check(player_turn.mark)
    puts "#{player_turn.name} is winner"
    return false
  end

  if move_counter >= 5 && move_counter == 9
    puts 'Draw game' unless board.win_check(player_turn.mark)
    false
  end
  true
end

game = true

move_counter = 1

while game
  game = if move_counter.odd?
           switch_user(player_one, board, move_counter)
         else
           switch_user(player_two, board, move_counter)
         end
  board.display_board
  move_counter += 1
end
