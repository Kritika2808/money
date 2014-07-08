#Calculates addition and difference of money in terms of rupee and paise

class Money
  include Comparable

  attr_reader :rupee, :paise

  def initialize rupee, paise
    @rupee=rupee
    @paise=paise
  end

  def to_s
    "#{@rupee} Rs. #{@paise} p"
  end

  def <=> money
    @rupee*100 + @paise <=> money.rupee*100 + money.paise
  end


  def == second_value
    return true if self.equal?(second_value)
    return false if second_value.nil?
    return false if second_value.class != self.class
    [@rupee, @paise] == [second_value.rupee, second_value.paise]
  end

  def hash
    [rupee, paise].hash
  end

  def eql?(second_value)
    self == second_value
  end

  def + second_value
    total =(@rupee+second_value.rupee)*100 + (@paise + second_value.paise)
    Money.new(total/100, total%100)
  end

  def - second_value
    if @paise > second_value.paise
      total = (@rupee-second_value.rupee)*100 + (@paise - second_value.paise)
      Money.new(total/100, total%100)
    else
      total = (@rupee-second_value.rupee)*100 - (@paise - second_value.paise)
      Money.new(total/100, total%100*-1)
    end
  end
end