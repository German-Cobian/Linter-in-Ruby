require_relative 'file_reader.rb'

class ErrorCheck
  attr_reader :lint_action, :error_messages, :line_by_line

  def initialize(file_path)
    @lint_action = FileReader.new(file_path)
    @error_messages = []
  end

  def check_errors
    trailing_space?
    empty_line_error?
  end

  def trailing_space?
    @lint_action.line_by_line.each_with_index do |line, i|
      if line[-2] == ' ' && !line.strip.empty?
        @error_messages << { line_num: i + 1, message: 'Trailing whitespace detected' } 
      end
    end
  end

  def empty_line_error?
    @lint_action.line_by_line.each_with_index do |line, i|
      class_empty_line?(line, i)
      def_empty_line?(line, i)
      end_empty_line?(line, i)
      do_empty_line?(line, i)
    end
  end

  def class_empty_line?(line, i)
    return unless line.strip.split(' ').first.eql?('class')
    
      @error_messages << { line_num: i + 2, message: 'Extra empty line detected at class body beginning' } if @lint_action.line_by_line[i + 1].strip.empty?
  end

  def def_empty_line?(line, i)
    return unless line.strip.split(' ').first.eql?('def')
    
      @error_messages << { line_num: i + 2, message: 'Extra empty line detected at method body beginning' } if @lint_action.line_by_line[i + 1].strip.empty?
      @error_messages << { line_num: i + 1, message: 'Use empty lines between method definition' } if @lint_action.line_by_line[i - 1].strip.split(' ').first.eql?('end')
  end

  def end_empty_line?(line, i)
    return unless line.strip.split(' ').first.eql?('end')
  
      @error_messages << { line_num: i, message: 'Extra empty line detected at block body end' }  if @lint_action.line_by_line[i - 1].strip.empty? 
  end

  def do_empty_line?(line, i)
    return unless line.strip.split(' ').include?('do')
   
      @error_messages << { line_num: i + 2, message: 'Extra empty line detected at block body beginning'  }  if @lint_action.line_by_line[i + 1].strip.empty?
  end

end