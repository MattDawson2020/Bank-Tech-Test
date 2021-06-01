class Transaction

  attr_reader :time, :credit, :debit, :balance

  def initialize(time:, credit:, debit:, balance:)
    @time = time
    @credit = credit
    @debit = debit
    @balance= balance
  end

end
