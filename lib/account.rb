require_relative 'transaction'
require_relative 'transaction_history'

class Account

  attr_reader :balance, :transaction_history

  def initialize(balance = 0, transaction_history: TransactionHistory.new)
    @balance = balance
    @transaction_history = transaction_history
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
