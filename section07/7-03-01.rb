# encoding: utf-8
class User
  def initialize
    puts "Initialized!"
  end
end

# newメソッドを実行した時に、クラスのinitializeメソッドが実行されるため、putsが行われる
user = User.new
#=> Initialized!

# ただし、initializeメソッドは特別なメソッドであるため、直接呼び出すことはできない
# ※デフォルトでprivateメソッドになっている
# User.initialize
#=> private method `initialize' called for User:Class (NoMethodError)

class User2
  def initialize(name, age)
    puts "#{name} is #{age} years old."
  end
end

# initializeメソッドに引数をつけた場合は、呼び出す際に引数は必須となる
# User2.new #=> wrong number of arguments (given 0, expected 2) (ArgumentError)

User2.new("Tom", "30") #=> Tom is 30 years old
