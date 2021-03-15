![](https://img.shields.io/badge/Microverse-blueviolet)


# Linter in Ruby


The project consists of four code files

The 'bin' folder
main The main is the executable file that controls lint logic.
The 'lib' folder
error_check.rb This class checks for mistakes within the code. Different methods are used to do this checks.

test.rb This short program is used to test our small linting program and see how it responds when a file is passed for error checks.

my_test.rb This medium program is used to test our small 'linting' program and see how it responds when a file is passed for error checks.

![screenshot](https://user-images.githubusercontent.com/68709712/107109629-db12f300-67f6-11eb-9fdb-95afcd599bc2.png)

## How to run the linter

clone the project and add the file or files to be linted in the project directory.
excecute the main.rb file inside bin/main.
Specify the path to the file when prompted (lib/my_test.rb for example).
The ruby file will run only if the path given is correct!

## Automated test

The Rspec test cases reside in example_spec.rb file in the spec folder.
To run the test cases, type (rspec spec/example_spec.rb) in your terminal.

## What my Ruby Linter tests

Check trailing space
It detects trailing space(s) at the end of each line
good
  def show_info
    puts 'checks a trailing space'|
  end
bad
  def show_info |
    puts 'checks a trailing space' |
  end
Check space(s) surrounding the (=) operator
Operator = should be surrounded by a single space
good
  def show_info(\*args)
    first_name = 'John'
    last_name = 'Doe'
  end
bad
  def show_info(\*args)
    first_name  = 'John'
    last_name =  'Doe'
  end
Check for double quotes (") around strings
Prefer single-quoted strings when you don't have string interpolation or special symbols
good
  def show_info(\*args)
    first_name = 'John'
    puts "My name is #{first_name}!"
  end
bad
  def show_info(\*args)
    first_name = "John"
    puts "My name is John!"
  end
Check indentation
It detects wrong indentation space
good
  class TheTest
    def initialize(*args)
      @first_name = args[0]
      @last_name = args[1]
    end
  end
bad
    class TheTest
    def initialize(*args)
      @first_name = args[0]
      @last_name = args[1]
    end
  end
Check for empty line
Check for empty line withing your code and make sure the necessary empty line is not more than 1
good
  class TheTest
    def initialize(*args)
      @first_name = args[0]
      @last_name = args[1]
    end

    def show_info
      puts @first_name + ' ' + @last_name
    end
  end
bad
  class TheTest
    def initialize(*args)
      @first_name = args[0]
      @last_name = args[1]
    end



    def show_info
      puts @first_name + ' ' + @last_name
    end
  end


## Development

Clone the project

Run the Application


## Built With

This project was built using these technologies.

  Ruby
  RSpec for Ruby testing
  Rubocop
  Git-Flow

## Authors

👤 **Author**

 German Cobian
  
  GitHub: @German-Cobian

  twitter: https://twitter.com/GermanCobian3


## 🤝 Contributing

Contributions, issues, and feature requests are welcome!


## Show your support

Give a ⭐️ if you like this project!


## Acknowledgments

  Microverse
  The Odin Project
  Ruby Documentation


## 📝 License

This project is [MIT](lic.url) licensed.

Creative Commons License https://creativecommons.org/licenses/by-nc/4.0/legalcode