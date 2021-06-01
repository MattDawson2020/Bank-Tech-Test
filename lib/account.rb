require 'transaction'
class Account

  attr_reader :balance

  def initialize(balance = 0)
    @balance = balance
  end

  def deposit(amount)
    @balance += amount
    Transaction.new( time: Time.now, credit: amount, debit: nil, balance: @balance)
  end

  def withdraw(amount)
    @balance -= amount
    Transaction.new( time: Time.now, credit: nil, debit: amount, balance: @balance)
  end

end
