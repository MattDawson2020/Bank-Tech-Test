class Transaction

  attr_reader :time, :amount, :type, :balance

  def initialize(time:, amount:, type:, balance:)
    @time = time
    @amount = amount
    @type = type
    @balance= balance
  end

end
