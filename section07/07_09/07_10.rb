class Greeting
  def hello
    puts "Hello"
  end

  alias h hello
end

g = Greeting.new
g.h

class User
  def hello
    puts "hello"
  end

  # undef hello
end

user = User.new
user.hello

class MiniTestFake
  class MiniTestFake
    def self.test_message
      puts "TEST!!!!"
    end
  end
end

MiniTestFake::MiniTestFake.test_message

private class Monitors
end
