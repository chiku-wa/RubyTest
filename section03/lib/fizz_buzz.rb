# ====================
# FizzBuzzテスト
# ====================

def fizz_buzz(num)
  str = ""

  if num % 3 == 0
    str += "Fizz"
  end
  if num % 5 == 0
    str += "Buzz"
  end

  if str == ""
    str = num.to_s
  end

  str
end

# puts fizz_buzz(6)
# puts fizz_buzz(9)
# puts fizz_buzz(7)
# puts fizz_buzz(5)
# puts fizz_buzz(15)
