require_relative 'file_reader.rb'

class ErrorCheck
  attr_reader :lint_action, :error_messages, :line_by_line

  def initialize(file_path)
    @lint_action = FileReader.new(file_path)
    @error_messages = []
  end

  def check_errors
    trailing_space?
  end

  def trailing_space?
  @lint_action.line_by_line.each_with_index do |line, i|
      if line[-2] == ' ' && !line.strip.empty?
        @error_messages << { line_num: i + 1, message: 'Trailing whitespace detected' } 
      end
    end
  end

end