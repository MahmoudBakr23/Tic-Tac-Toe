#!/usr/bin/env ruby

require_relative '../lib/player.rb'
require_relative '../lib/board.rb'

puts "player one's name ..."
name = gets.chomp
player_one = Player.new(name, "X")

puts
puts "player two's name ..."
name = gets.chomp
player_two = Player.new(name, "O")
puts

puts "#{player_one.name} is #{player_one.mark}"
puts "#{player_two.name} is #{player_two.mark}"
puts

board = Board.new

board.display_board

move_counter = 1

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

while move_counter < 10
  if move_counter.odd?
    puts "#{player_one.name}'s move"
    move = gets.chomp.to_i
    move = valid_number(move)
    move = check_invalid_slot(move, board)
    board.booked_slots.push(move)
    board.mark_on_board(move, 'X')
    if move_counter >= 5
      if board.win_check(player_one.mark)
        puts "#{player_one.name} is winner"
        board.display_board
        break
      end
      if move_counter == 9
        unless board.win_check(player_one.mark)
          puts "Draw game"
        end  
      end
    end

  else
    puts "#{player_two.name}'s move"
    move = gets.chomp.to_i
    move = valid_number(move)
    move = check_invalid_slot(move, board)
    board.booked_slots.push(move)
    board.mark_on_board(move, 'O')
    if move_counter >= 5
      if board.win_check(player_two.mark)
        puts "#{player_two.name} is winner"
        board.display_board
        break
      end
      if move_counter == 9
        unless board.win_check(player_two.mark)
          puts "Draw game"
        end  
      end
    end
  end
  
  board.display_board
  move_counter += 1
end
