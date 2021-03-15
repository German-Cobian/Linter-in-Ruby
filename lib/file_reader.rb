require_relative 'check_error.rb'

class FileReader
  attr_reader :file_path, :valid, :line_by_line

  def initialize(file_path)
    @file_path = file_path
    @valid = true
    begin
      @line_by_line = File.readlines(@file_path)
    rescue StandardError
      @valid = false
    end
  end
end





