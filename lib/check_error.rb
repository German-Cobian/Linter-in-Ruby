require 'strscan'
require_relative 'file_reader'

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
    indentation_for_class?
    double_space_around_operator?
  end

  private

  def trailing_space?
    @lint_action.line_by_line.each_with_index do |line, idx|
      @error_messages << { line_num: idx + 1, message: 'Trailing whitespace detected' } if line[-2] == ' ' && !line.strip.empty?
    end
  end

  def empty_line_error?
    @lint_action.line_by_line.each_with_index do |line, idx|
      class_empty_line?(line, idx)
      def_empty_line?(line, idx)
      end_empty_line?(line, idx)
      do_empty_line?(line, idx)
    end
  end

  def class_empty_line?(line, idx)
    return unless line.strip.split(' ').first.eql?('class')

    @error_messages << { line_num: idx + 2, message: 'Extra empty line detected at class body beginning' } if @lint_action.line_by_line[idx + 1].strip.empty?
  end

  def def_empty_line?(line, idx)
    return unless line.strip.split(' ').first.eql?('def')

    @error_messages << { line_num: idx + 2, message: 'Extra empty line detected at method body beginning' } if @lint_action.line_by_line[idx + 1].strip.empty?
    @error_messages << { line_num: idx + 1, message: 'Use empty lines between method definition' } if @lint_action.line_by_line[idx - 1].strip.split(' ').first.eql?('end')
  end

  def end_empty_line?(line, idx)
    return unless line.strip.split(' ').first.eql?('end')

    @error_messages << { line_num: idx, message: 'Extra empty line detected at block body end' } if @lint_action.line_by_line[idx - 1].strip.empty?
  end

  def do_empty_line?(line, idx)
    return unless line.strip.split(' ').include?('do')

    @error_messages << { line_num: idx + 2, message: 'Extra empty line detected at block body beginning' } if @lint_action.line_by_line[idx + 1].strip.empty?
  end

  def check_tag_error(*args)
    @lint_action.line_by_line.each_with_index do |line, idx|
      begin_p = []
      end_p = []
      begin_p << line.scan(args[0])
      end_p << line.scan(args[1])
      if begin_p.flatten.size < end_p.flatten.size
        @error_messages << { line_num: idx + 1,
                             message: "Lint/Syntax: Unexpected/Missing token '#{args[2]}' #{args[4]}" }
      elsif begin_p.flatten.size > end_p.flatten.size
        @error_messages << { line_num: idx + 1,
                             message: "Lint/Syntax: Unexpected/Missing token '#{args[3]}' #{args[4]}" }
      end
    end
  end

  def tag_error?
    check_tag_error(/\(/, /\)/, '(', ')', 'Parenthesis')
    check_tag_error(/\[/, /\]/, '[', ']', 'Square Bracket')
    check_tag_error(/\{/, /\}/, '{', '}', 'Curly Bracket')
  end

  def double_quotes?
    @lint_action.line_by_line.each_with_index do |line, idx|
      next unless line.include? '"'

      unless quotes_contain_variable(line)
        @error_messages << { line_num: idx + 1,
                             message: 'Prefer single-quoted strings when no string interpolation or special symbols' }
      end
    end
  end

  def quotes_contain_variable(line)
    quote_position = line.index('"')
    return false if quote_position.nil?

    rest_of_line = line[quote_position + 1..-1]
    second_quote_position = rest_of_line.index('"')
    quotes_content = line[quote_position + 1..second_quote_position]
    quotes_content.include? '#{'
  end

  def indentation_for_class?
    key_word = ['class']
    @lint_action.line_by_line.each_with_index do |line, idx|
      temp_string = line.strip
      key_word.each do |value|
        if temp_string[0...value.size] == value && line[0] == ' '
          @error_messages << { line_num: idx + 1,
                               message: 'Wrong indentation space' }
        end
      end
    end
  end

  def double_space_around_operator?
    @lint_action.line_by_line.each_with_index do |line, idx|
      if line.strip.include? '=  '
        @error_messages << { line_num: idx + 1, message: 'Operator = should be surrounded by a single space' }
      elsif line.strip.include? '  ='
        @error_messages << { line_num: idx + 1, message: 'Operator = should be surrounded by a single space' }
      end
    end
  end
end
