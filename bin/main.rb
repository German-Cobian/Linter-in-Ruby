require_relative '../lib/file_reader'
require_relative '../lib/check_error'

def show_errors(check)
  system('cls') || system('clear')
  check.error_messages.each { |error| puts "\nLine #{error[:line_num]}: #{error[:message]}" }
end
puts
puts "\nPlease type path of file you intend to check:"
file_path = gets.chomp
check = ErrorCheck.new(file_path)
go_ahead = FileReader.new(file_path)
if go_ahead.valid
  puts "\nChecking #{file_path} for errors."
  check.check_errors
  show_errors(check)
  puts "\n#{check.error_messages.size} offenses detected"
else
  puts "\nCould not open file #{file_path}\n"
end
puts
