class RomanValue
  attr_accessor :test_input

  ROMAN = {I: 1, V: 5, X: 10, L: 50, C: 100, D: 500, M: 1000}

  def convert
    ans = 0
    if input_text.empty?
      puts "Please enter a Roman Number"
    elsif valid_number?
      input_text.each_with_index do |val,index|
        next if !index.eql?(0) && check_precedence(input_text[index - 1],val)
        if input_text[index + 1] && check_precedence(val,input_text[index + 1])
          ans += ROMAN[input_text[index + 1].to_sym] - ROMAN[val.to_sym]
        else
          ans += ROMAN[val.to_sym]
        end
      end
      puts "The value of #{test_input} is #{ans}"
    else
      puts "This is not a valid roman number."
    end
  end

  private

  def valid_number?
    return false if number_invalid?
    return false if check_number_exist?(["I","X","C","M"],4)
    return false if check_repetition(["D","L","V"])
    return false if subtraction_invalid?
    return false if subtraction_prohibited?
    true
  end

  def number_invalid?
    input_text.detect{|character| !ROMAN.keys.include?(character.to_sym)}
  end

  def check_number_exist?(arr, num)
    arr.detect do |number|
      test_input.include?(number * num)
    end
  end

  def check_repetition(arr)
    arr.detect {|num| test_input.each_char.find { test_input.count(num) > 1 }}
  end

  def subtraction_invalid?
    if check_number_exist?(["I","X","C"],1)
      return true if test_input =~ /I[^X­VI]/
      test_input =~ /X[^LCIXV]/
    else
      false
    end
  end

  def subtraction_prohibited?
    if check_number_exist?(["D","L","V"],1)
      return true if test_input =~ /V[^I]/
      return true if test_input =~ /L[^XIV]/
      test_input =~ /D[^IVXLC]/
    else
      false
    end
  end

  def check_precedence(a,b)
    ROMAN[a.to_sym] < ROMAN[b.to_sym]
  end

  def input_text
    @input_text ||= test_input.split("")
  end
end

File.open("input.txt", "r") do |f|
  f.each_line do |line|
    rv = RomanValue.new
    rv.test_input = line.chomp.upcase
    rv.convert
  end
end
