![](https://img.shields.io/badge/Microverse-blueviolet)

# Linter-in-Ruby

This project provides feedback about errors in code. The project consists of four code files.

  The 'bin' folder
  main.rb This is the executable file that controls lint logic.
  The 'lib' folder
  file_reader.rb This class reads the file that is to be checked on a line by line basis.
  error_check.rb This class checks for mistakes within the code. Different methods are used to do this checks.

  my_test.rb This short file is used to test our linting program and see how it responds when a file is passed for error checks.

The project was built completely with Ruby following all possible best practices. Rubocop was used as a code-linter alongside Gitflow to ensure I maintain good coding standards.


## What my Ruby Linter tests

The custom Ruby linter currently checks/detects for the following errors/warnings.

* check for trailing space(s) at the end of each line
* check for empty line errors
* check for missing/unexpected tags i.e. '( )', '[ ]', and '{ }'
* check for double quotes when there are no string interpolation or special symbols
* check for that no indentation occurs on a line where a class is declared
* check that there are only single spaces around an operator

Below are demonstrations of good and bad code for the above cases. I will use the pipe '|' symbol to indicate cursor position where necessary.


### Check for trailing spaces
  
  good
  
    puts board.display
    puts 'Player 1 enter your name.'|   
    name_player1  =  gets.chomp.upcase
    puts 'Player 2 enter your name'
    name_player2 = gets.chomp.upcase  
  
  bad
  
    puts board.display
    puts 'Player 1 enter your name.'    | 
    name_player1  =  gets.chomp.upcase
    puts 'Player 2 enter your name'
    name_player2 = gets.chomp.upcase


### Check for empty lines
  
  good
  
    class Player
      def initialize(name,token,board)
        @name =name
        @token = token
        @board = board
      end
      
      def turn(location)
        @board.update_board location, @token)
      end
    end

  bad
  
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


### Check for missing/unexpected tags

  good
  
    player1 = Player.new(name_player1, token_player1, board)
    player2 = Player.new(name_player2, token_player2, board)
    puts "#{player1.name} your token is: #{player1.token}. #{player2.name} your token is: #{player2.token}."
    puts "#{up_next.name} its your move. Enter the number of the position where you wish to place your token."

  bad
  
    player1 = Player.new(name_player1, token_player1, board
    player2 = Player.new name_player2, token_player2, board)
    puts "#player1.name} your token is: #{player1.token}. #{player2.name} your token is: #{player2.token}."
    puts "#{up_next.name its your move. Enter the number of the position where you wish to place your token."
    

### Check for double quotes (") around strings
    
  good
  
    puts 'Player 1 enter your name.'   
    puts 'Player 2 enter your name.'
    puts "#{name_player1}, choose your token: either O or X"

  bad
  
    puts "Player 1 enter your name."   
    puts "Player 2 enter your name."
    puts "#{name_player1}, choose your token: either O or X."


### Check indentation on line where a class is declared
  
  good
  
    class Board
      def initialize
        @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      end
    end
  
  bad
  
      class Board
      def initialize
        @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      end
    end


### Check space(s) surrounding the (=) operator

  good
  
    def initialize(name, token, board)
      @name = name
      @token = token
      @board = board
    end

  bad
  
    def initialize(name, token, board)
      @name  =  name
      @token  =  token
      @board  =  board
    end


## Built With

This project was built using these technologies.

* Ruby
* RSpec for Ruby testing
* Rubocop
* Git-Flow


## Getting Started


### How to run the linter


* Get a local copy of the repository by running the following commands on your terminal:

      $ cd <folder>    
      $ git clone git@github.com:German-Cobian/Linter-in-Ruby.git
   
* Add the file or files to be linted in the project root directory.
* Execute the main.rb file inside bin/main.
* Specify the path to the file when prompted (../my_test.rb is the sample test file provided).
* The ruby file will run only if the path given is correct!


### Automated tests

* The Rspec test cases reside in example_spec.rb file in the spec folder.
* To run the test cases, type rspec in your terminal.


## Authors

👤 **German Cobian**

* GitHub: [@German-Cobian](https://github.com/German-Cobian)
* Twitter: [@GermanCobian3](https://twitter.com/GermanCobian3)
* LinkedIn: [@german-cobian](https://www.linkedin.com/in/german-cobian)


## 🤝 Contributing

Contributions, issues, and feature requests are welcome!


## Show your support

Give a ⭐️ if you like this project!


## Acknowledgments

* Microverse
* The Odin Project
* Ruby Documentation


## 📝 License

This project is [MIT](https://github.com/German-Cobian/Linter-in-Ruby/blob/main/LICENSE) licensed.