require 'byebug'
class RomanValue
  attr_accessor :test

  ROMAN = {I: 1, V: 5, X: 10, L: 50, C: 100, D: 500, M: 1000}

  def calculate_value
    ans = 0
    if valid_number?(test)
      test.split("").each_with_index do |val,index|
        next if test[index - 1] && check_precedence(test[index - 1],val)
        if test[index + 1] && check_precedence(val,test[index + 1])
          ans += ROMAN[test[index + 1].to_sym] - ROMAN[val.to_sym]
        else
          ans += ROMAN[val.to_sym]
        end
      end
      puts "#{ans}"
    end
  end

  private

  def valid_number?(text)
    return false if check_number_exist?(["I","X","C","M"],4,text)
    return false if check_number_exist?(["D","L","V"],2,text)
    true
  end

  def check_number_exist?(arr = [],num, text)
    arr.detect {|number| text.include?(number * num)}
  end

  def check_precedence(a,b)
    ROMAN[a.to_sym] < ROMAN[b.to_sym]
  end
end

rv = RomanValue.new
rv.test = gets.chomp
rv.calculate_value
