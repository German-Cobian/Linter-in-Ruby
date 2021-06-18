![](https://img.shields.io/badge/Microverse-blueviolet)

# Linter-in-Ruby

This project provides feedback about errors in code. The project consists of four code files.

  The `bin` folder
  The executable file that controls lint logic `main.rb`
  The `lib` folder
  The `file_reader.rb` class, which reads the file that is to be checked on a line by line basis
  This `error_check.rb` class checks for mistakes within the code. Different methods are used to do these checks

  This short `my_test.rb` file, which is used to test our linting program and see how it responds when a file is passed for error checks.

The project was built completely with Ruby following all possible best practices. Rubocop was used as a code-linter alongside Gitflow to ensure the maintenance good coding standards.


## What Linter-in-Ruby tests

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
* RSpec

    
## Getting Started

 To run this program on your local machine, simply follow the steps below:

### Prerequisites
 Install the ruby programming language.

### How to run the linter
* Clone this repo on your local machine by running ``git clone git@github.com:German-Cobian/Linter-in-Ruby.git``
* `cd` into the `Linter-in-Ruby` folder you just cloned.
* Add the file or files to be linted in the project root directory.
* Execute the `main.rb` file inside bin/main.
* Specify the path to the file when prompted (../my_test.rb is the sample test file provided).
* The ruby file will run only if the path given is correct!


### Testing with RSpec
  This project is tested with Rspec which is a computer domain-specific language (DSL) testing tool written in the Ruby programming language.


### How to get Rspec Running
* Run the following command in the terminal: `gem install rspec` This command installs Rspec on your computer
* Ensure that Rspec is installed by running `rspec --version` which will list the installed version
* You should get output similar to the following:
  ```
    RSpec 3.10
      rspec-core 3.10.1
      rspec-expectations 3.10.1
      rspec-mocks 3.10.2
      rspec-support 3.10.2
  ```
* The rspec gem comes packed with all you need to get started including the 5 gems listed above.
* Run `rspec --init` to initialize RSpec. This generates a /spec folder and a .rspec file at the root of your project.
* The Rspec test cases reside in `example_spec.rb` file in the spec folder.
* To run the test cases, run `rspec` in your terminal.


## Author

👤 **German Cobian**

* GitHub: [@German-Cobian](https://github.com/German-Cobian)
* Twitter: [@GermanCobian1](https://twitter.com/GermanCobian1)
* LinkedIn: [@german-cobian](https://linkedin.com/german-cobian)


## 🤝 Contributing

Contributions, issues, and feature requests are welcome!


## Show your support

Give a ⭐️ if you like this project!


## Acknowledgments

* Guidelines for this project supplied by Microverse


## 📝 License

This project is [MIT](https://github.com/German-Cobian/Linter-in-Ruby/blob/main/LICENSE) licensed.