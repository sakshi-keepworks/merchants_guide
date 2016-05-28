class RomanValue
  attr_accessor :test

  ROMAN = {I: 1, V: 5, X: 10, L: 50, C: 100, D: 500, M: 1000}

  def calculate_value
    ans = 0
    if valid_number?
      test.split("").each_with_index do |val,index|
        next if !index.eql?(0) && check_precedence(test[index - 1],val)
        if test[index + 1] && check_precedence(val,test[index + 1])
          ans += ROMAN[test[index + 1].to_sym] - ROMAN[val.to_sym]
        else
          ans += ROMAN[val.to_sym]
        end
      end
      puts "#{ans}"
    else
      puts "The number is invalid."
    end
  end

  private

  def valid_number?
    return false if check_number_exist?(["I","X","C","M"],4)
    return false if check_repetition?(["D","L","V"])
    return false if check_subtraction
    return false if check_no_subtraction
    true
  end

  def check_number_exist?(arr, num)
    arr.detect {|number| test.include?(number * num)}
  end

  def check_repetition?(arr)
    arr.detect {|num| test.each_char.find { test.count(num) > 1 }}
  end

  def check_subtraction
    if check_number_exist?(["I","X","C"],1)
      return true if test =~ /I[^X­VI]/
      test =~ /X[^LCIX]/
    else
      false
    end
  end

  def check_no_subtraction
    if check_number_exist?(["D","L","V"],1)
      return true if test =~ /V[^I]/
      return true if test =~ /L[^XIV]/
      test =~ /D[^IVXLC]/
    else
      false
    end
  end

  def check_precedence(a,b)
    ROMAN[a.to_sym] < ROMAN[b.to_sym]
  end
end

rv = RomanValue.new
rv.test = gets.chomp
rv.calculate_value
