puts board.display
puts 'Player 1 enter your name.'    
name_player1  =  gets.chomp.upcase
puts "Player 2 enter your name"
name_player2 = gets.chomp.upcase
puts "#{name_player1}, choose your token: either O or X"
token_player1 = gets.strip.upcase

token_player2 = token_player1 == 'X' ? 'O' : 'X'
player1 = Player.new(name_player1, token_player1, board
player2 = Player.new name_player2, token_player2, board)
puts "#player1.name} your token is: #{player1.token}. #{player2.name} your token is: #{player2.token}"
puts "#{up_next.name its your move. Enter the number of the position where you wish to place your token.""
board = 1, 2, 3, 4, 5, 6, 7, 8, 9]


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