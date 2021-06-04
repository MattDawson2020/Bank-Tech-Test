class Transaction
  attr_reader :time, :amount, :type
  attr_accessor :balance

  def initialize(time:, amount:, type:, balance:)
    @time = time
    @amount = amount
    @type = type
    @balance = balance
  end

end
