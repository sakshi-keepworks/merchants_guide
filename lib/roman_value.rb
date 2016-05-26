class RomanValue
  attr_accessor :test

  ROMAN = {I: 1, V: 5, X: 10, L: 50, C: 100, D: 500, M: 1000}

  def find_value
    ans = 0
    if valid_number?(test)
      test.split("").each_with_index do |val,index|
        if test[index+1] && check_precedence(val.to_sym,test[index + 1].to_sym)
          ans += ROMAN[test[index + 1].to_sym] - ROMAN[val.to_sym]
          next
        else
          ans += ROMAN[val.to_sym]
        end
      end
      puts "#{ans}"
    end
  end

  private

  def valid_number?(text)
    ["I","X","C","M"].each do |num|
      if text.include?(repeat(num))
        puts "The number is invalid."
        break
      end
    end
  end

  def repeat(text, n=4)
    text * n
  end

  def check_precedence(a,b)
    ROMAN[a] < ROMAN[b]
  end
end

rv = RomanValue.new
rv.test = gets.chomp
rv.find_value
