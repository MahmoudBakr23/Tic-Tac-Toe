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

(0..board.length - 1).each do |i|
  (0..board.length - 1).each do |j|
    print board[i][j].to_s + " "
  end
  puts
end
puts
puts "#{player_1}'s move"
