class Account

  attr_reader :balance, :transaction_history

  def initialize(balance = 0, transaction_history: TransactionHistory.new)
    @balance = balance
    @transaction_history = transaction_history
  end

  def deposit(amount)
    validate_deposit(amount)
    @balance += amount
    store_transaction(Transaction.new(time: Time.now, type: :deposit, amount: amount, balance: @balance))
  end

  def withdraw(amount)
    validate_withdrawal(amount)
    @balance -= amount
    store_transaction(Transaction.new(time: Time.now, type: :withdrawal, amount: amount, balance: @balance))
  end

  private
  
  def store_transaction(transaction)
    @transaction_history.add_transaction(transaction)
  end

  def validate_deposit(amount)
    fail "Invalid input type, please deposit numeric currency" unless (amount.is_a?(Integer) || amount.is_a?(Float))
  end

  def validate_withdrawal(amount)
    fail "Invalid withdrawal request, please withdraw numeric currency" unless (amount.is_a?(Integer) || amount.is_a?(Float))
    fail "Insufficient funds" if amount > @balance
  end

end
