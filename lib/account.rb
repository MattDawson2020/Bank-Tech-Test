require_relative 'transaction'
require_relative 'transaction_history'
require 'date'

class Account
  attr_reader :balance, :transaction_history

  def initialize(balance = 0, transaction_history: TransactionHistory.new)
    @balance = balance
    @transaction_history = transaction_history
  end

  def deposit(amount)
    @balance += amount
    store_transaction(Transaction.new(time: Time.now, type: :deposit, amount: amount, balance: @balance))
  end

  def withdraw(amount)
    @balance -= amount
    store_transaction(Transaction.new(time: Time.now, type: :withdrawal, amount: amount, balance: @balance))
  end

  def print_statement
    puts "Date  ||  Credit  ||  Debit  ||  Balance\n" +
    @transaction_history.transactions.reverse.map { |transaction| format_transaction(transaction) }.join("\n")
  end

  private
  
  def store_transaction(transaction)
    @transaction_history.add_transaction(transaction)
  end

  def format_type(transaction)
    if transaction.type == :deposit
      ' || ' + '%.2f' % transaction.amount + ' || || '
    else
      ' || || ' + '%.2f' % transaction.amount + ' || '
    end
  end

  def format_transaction(transaction)
    transaction.time.strftime("%d/%m/%Y") + format_type(transaction) + '%.2f' % transaction.balance
  end

end
