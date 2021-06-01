class Transaction

  attr_reader :time, :debit, :balance

  def initialize(time:, credit:, debit:, balance:)
    @time = time
    @credit = credit
    @debit = debit
    @balance= balance
  end

  def credit 
    return @credit unless @credit.nil?
  end

end
