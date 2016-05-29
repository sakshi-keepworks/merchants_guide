require 'spec_helper'

describe 'romanvalue' do
  context "with an invalid string roman number" do
    it 'can validate a number' do
      roman_number = RomanValue.new
      roman_number.test_input = "ABC"
      result = roman_number.convert
      expect(result).to eq('This is not a valid roman number.')
    end
  end

  context "with an invalid integer roman number" do
    it 'returns invalid number' do
      roman_number = RomanValue.new
      roman_number.test_input = "3674"
      result = roman_number.convert
      expect(result).to eq('This is not a valid roman number.')
    end
  end

  context "with an invalid roman number" do
    it 'checks "X" 4 times invalid' do
      roman_number = RomanValue.new
      roman_number.test_input = "XXXX"
      result = roman_number.convert
      expect(result).to eq('This is not a valid roman number.')
    end

    it 'checks "I" 4 times invalid' do
      roman_number = RomanValue.new
      roman_number.test_input = "IIII"
      result = roman_number.convert
      expect(result).to eq('This is not a valid roman number.')
    end

    it 'checks repetition of "D" in succession' do
      roman_number = RomanValue.new
      roman_number.test_input = "DD"
      result = roman_number.convert
      expect(result).to eq('This is not a valid roman number.')
    end

    it 'checks repetition of "D"' do
      roman_number = RomanValue.new
      roman_number.test_input = "DMD"
      result = roman_number.convert
      expect(result).to eq('This is not a valid roman number.')
    end

    it 'checks repetition of "L"' do
      roman_number = RomanValue.new
      roman_number.test_input = "LXL"
      result = roman_number.convert
      expect(result).to eq('This is not a valid roman number.')
    end

    it 'checks repetition of "L" in succession' do
      roman_number = RomanValue.new
      roman_number.test_input = "LLXL"
      result = roman_number.convert
      expect(result).to eq('This is not a valid roman number.')
    end

    it 'checks for invalid subtraction for "X"' do
      roman_number = RomanValue.new
      roman_number.test_input = "XD"
      result = roman_number.convert
      expect(result).to eq('This is not a valid roman number.')
    end
  end
end
