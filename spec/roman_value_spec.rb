require 'spec_helper'

describe 'romanvalue' do
  it 'can validate a number' do
    roman_number = RomanValue.new
    roman_number.test_input = "ABC"
    roman_number.convert
  end
end
