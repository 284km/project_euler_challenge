# (1..4000000).reduce(0){|v, i| i.even? ? v += i : v}
#=> 4000002000000
# 間違えた。values do not exceed four million だった。

# 再度間違えた。自信持って書いたけどそもそもフィボナッチじゃないし
# v_all = 0
# v_even = 0
# (1..Float::INFINITY).each do |i|
#   v_all += i
#   break if v_all > 4000000
#   v_even += v_all if v_all.even?
# end
# puts v_even
# puts v_all, v_even
# #=> 4000206
# #=> 1884764434

# やっと正解
module Fib
  def self.call
    @result = 0
    self.fib(0, 1)
    @result
  end

  def self.fib(i1, i2)
    sum = i1 + i2
    return sum if sum > 4000000
    @result += sum if sum.even?
    self.fib(i2, sum)
  end
end
puts Fib.call
#=> 4613732
