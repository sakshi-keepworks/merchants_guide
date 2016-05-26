class RomanValue
  attr_accessor :test
  roman = [I: 1, V: 5, X: 10, L: 50, C: 100, D: 500, M: 1000]
  precede = ["I","V","X","L","C","D","M"]

  def find_value
    ans = 0
    if valid_number?(test)
      test.split("").each_with_index do |val,index|
        if test[index + 1] && check_precedence(val,test[index + 1])
          ans += roman.first[test[index + 1].to_sym] - roman.first[val.to_sym]
          next
        else
          ans += roman.first[val.to_sym]
        end
      end
      ans
    end
  end

  private

  def valid_number?(text)
    ["I","X","C","M"].each do |num|
      text.include?(repeat(num))
    end
  end

  def repeat(text, n=4)
    text * n
  end

  def check_precedence(a,b)
    precede.index(a) > precede.index(b)
  end
end

rv = RomanValue.new
rv.test = gets
rv.find_value
