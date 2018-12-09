require_relative "../lib/fizz_buzz.rb"

# Minitestと違ってメソッド名を定義しない
RSpec.describe "Fizz Buzz" do
  example "return numeric" do
    expect(fizz_buzz(1)).to eq "1"
    expect(fizz_buzz(2)).to eq "2"
  end
  example "return Fizz Buzz" do
    expect(fizz_buzz(3)).to eq "Fizz"
    expect(fizz_buzz(5)).to eq "Buzz"
    expect(fizz_buzz(15)).to eq "FizzBuzz"
  end
end
