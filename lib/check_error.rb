require 'strscan'
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
    tag_error?
    double_quotes?
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

  def check_tag_error(*args)
    @lint_action.line_by_line.each_with_index do |line, i|
      begin_p = []
      end_p = []
      begin_p << line.scan(args[0])
      end_p << line.scan(args[1])

      if begin_p.flatten.size < end_p.flatten.size
        @error_messages << { line_num: i + 1, message: "Lint/Syntax: Unexpected/Missing token '#{args[2]}' #{args[4]}" } 
      elsif begin_p.flatten.size > end_p.flatten.size
        @error_messages << { line_num: i + 1, message: "Lint/Syntax: Unexpected/Missing token '#{args[3]}' #{args[4]}" }
      end
    end
  end

  def tag_error?
    check_tag_error(/\(/, /\)/, '(', ')', 'Parenthesis')
    check_tag_error(/\[/, /\]/, '[', ']', 'Square Bracket')
    check_tag_error(/\{/, /\}/, '{', '}', 'Curly Bracket')
  end

  def double_quotes?
    @lint_action.line_by_line.each_with_index do |line, i|
      next unless line.include? '"'

      unless quotes_contain_variable(line)
        @error_messages << { line_num: i + 1, message: 'Prefer single-quoted strings when you don\'t need string interpolation or special symbols' }
      end
    end
  end

end