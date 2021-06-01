require_relative 'transaction'
require_relative 'transaction_history'
require 'date'

class Account

  attr_reader :balance, :transaction_history

  def initialize(balance = 0.00, transaction_history: TransactionHistory.new)
    @balance = balance
    @transaction_history = transaction_history
  end

  def deposit(amount)
    @balance += amount
    store_transaction(Transaction.new( time: Time.now, credit: amount, debit: nil, balance: @balance))
  end

  def withdraw(amount)
    @balance -= amount
    store_transaction(Transaction.new( time: Time.now, credit: nil, debit: amount, balance: @balance))
  end

  def print_statement
    "Date  ||  Credit  ||  Debit  ||  Balance\n" +
    @transaction_history.transactions.reverse.map { |transaction| format_transaction(transaction) }.join("\n")
  end


  private 
  
  def store_transaction(transaction)
    @transaction_history.add_transaction(transaction)
  end

  def format_type(transaction)
    if !transaction.credit.nil?
      ' || ' + '%.2f' % transaction.credit + ' || || '
    else
      ' || || ' + '%.2f' % transaction.debit+ ' || '
    end
  end

  def format_transaction(transaction)
    transaction.time.strftime("%d/%m/%Y") + format_type(transaction) + '%.2f' % transaction.balance
  end

end
