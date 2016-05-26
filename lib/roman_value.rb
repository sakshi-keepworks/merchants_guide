class RomanValue
  attr_accessor :test

  def find_value
    roman = [I: 1, V: 5, X: 10, L: 50, C: 100, D: 500, M: 1000]
    roman = roman.first
    ans = 0
    if valid_number?(test)
      test.split("").each_with_index do |val,index|
        if test[index + 1] && check_precedence(val,test[index + 1])
          ans += roman[test[index + 1].to_sym] - roman[val.to_sym]
          next
        else
          ans += roman[val.to_sym]
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
    precede = ["I","V","X","L","C","D","M"]
    precede.index(a) > precede.index(b)
  end
end

rv = RomanValue.new
rv.test = gets.chomp
rv.find_value
