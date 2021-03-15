require_relative '../lib/check_error.rb'

RSpec.describe ErrorCheck do
  instance = ErrorCheck.new('../my_test.rb')
  describe 'valid' do
    FileReader.new('../my_test.rb')
    it 'returns true if it opens a file and read its lines' do
      expect(instance.error_messages.all?).to be true
    end

    it 'returns error message if it does not find a file to open' do
      expect(instance.error_messages.any? { |msg| msg[:message] == 'Could not... etc' }).to be false
    end

    it 'returns false if it opens a file and read its lines' do
      expect(instance.error_messages.any? { |msg| msg[:message] == 'Checking... etc' }).to be false
    end
  end

  describe '#trailing_space?' do
    it 'returns false if there is no trailing space at the end of the line' do
      expect(false).not_to match(@error_messages)
    end

    it 'returns true if there is/are trailing space at the end of the line' do
      expect(@error_messages).to match(@error_messages)
    end
  end

  describe '#empty_line_error' do
    it 'returns empty line error' do
      @lint_action.empty_line_error
      expect(@error_messages[0]).to eql('line:11 Extra empty line detected at block body end')
    end
  end

  describe '#tag_error?' do
    it "returns missing/unexpected tags eg '( )', '[ ]', and '{ }'" do
      @lint_action.tag_error
      expect(@error_messages[0]).to eql("line:3 Lint/Syntax: Unexpected/Missing token ']' Square Bracket")
    end
  end

  describe '#double_quotes?' do
    it 'returns false if (") is not found around strings' do
      expect(false).not_to match(@error_messages)
    end

    it 'returns false if (") is found around strings that include Regex' do
      expect(false).not_to match(@error_messages)
    end

    it 'returns true if (") is found around strings' do
      expect(@error_messages).to match(@error_messages)
    end
  end

  describe '#indentation_for_class?' do
    it 'returns false if there is no space before the keyword' do
      expect(false).not_to match @error_messages
    end

    it 'returns true if there is space(s) before the keyword' do
      expect(@error_messages).to match(@error_messages)
    end
  end

  describe '#double_space_around_operator?' do
    it 'returns false if the (=) operator is surrounded by single space' do
      expect(false).not_to match(@error_messages)
    end

    it 'returns true if the (=) operator is surround by more than a single space' do
      expect(@error_messages).to match(@error_messages)
    end
  end
end
