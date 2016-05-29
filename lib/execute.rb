require './lib/roman_value'

File.open("./data/input.txt", "r") do |f|
  f.each_line do |line|
    roman_number = RomanValue.new
    roman_number.test_input = line.chomp.upcase
    output = roman_number.convert
    puts "#{output}"
  end
end

