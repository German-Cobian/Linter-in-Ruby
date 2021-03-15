board = Board.new
puts board.display
puts 'Player 1 enter your name.'   
name_player1 = gets.chomp.upcase
puts "Player 2 enter your name"
name_player2 = gets.chomp.upcase
puts "#{name_player1}, choose your token: either O or X"
token_player1 = gets.strip.upcase

until %w[X O].include?(token_player1)
  puts "That is not a valid token. Choose either O or X"
  puts
  token_player1 = gets.strip.upcase
  puts
  next unless token_player1 != 'X' && token_player1 != 'O'

  puts "Ok #{name_player1}, you get assigned X"
  puts
  token_player1 = 'X'
end

token_player2 = token_player1 == 'X' ? 'O' : 'X'
player1 = Player.new(name_player1, token_player1, board
player2 = Player.new(name_player2, token_player2, board)
puts "#player1.name} your token is: #{player1.token}. #{player2.name} your token is: #{player2.token}"
puts

puts "#{up_next.name its your move. Enter the number of the position where you wish to place your token.""
location = gets.chomp.to_i - 1

end

  class Player

  def initialize(name, token, board)
    @name  =  name
    @token = token
    @board = board
  end

  def turn(location)

    @board.update_board location, @token)
  end

end

  class Board

  attr_reader :board

  def initialize
    @board = 1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def update_board(location, token)

    @board[location  =  token

  end

end

  