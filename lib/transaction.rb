class Transaction
  attr_reader :time, :amount
  attr_accessor :balance

  def initialize(time:, amount:, balance:)
    @time = time
    @amount = amount
    @balance = balance
  end

end
