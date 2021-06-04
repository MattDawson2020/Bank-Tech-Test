class Transaction
  attr_reader :time, :amount
  # accessor is the simnplest and most concise way to update balance. Online was split, some said this is really efficient and better,
  # some said this wasn't the best way to do it, please advise
  attr_accessor :balance

  def initialize(time:, amount:, balance:)
    @time = time
    @amount = amount
    @balance = balance
  end

end
