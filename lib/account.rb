class Account

  attr_reader :transaction_history

  def initialize()
    @transaction_history = []
  end

  def balance
    new_account? ? 0 : @transaction_history.last.balance
  end

  def deposit(amount)
    validate_deposit(amount)
    old_balance = balance
    @transaction_history <<  Transaction.new(time: Time.now, type: :deposit, amount: amount, balance: old_balance += amount)
  end

  def withdraw(amount)
    validate_withdrawal(amount)
    old_balance = balance
    @transaction_history << Transaction.new(time: Time.now, type: :withdrawal, amount: amount, balance: old_balance -= amount)
  end

  private

  def validate_deposit(amount)
    fail 'Invalid input type, please deposit numeric currency' unless amount.is_a?(Integer) || amount.is_a?(Float)
  end

  def validate_withdrawal(amount)
    fail 'Invalid withdrawal request, please withdraw numeric currency' unless amount.is_a?(Integer) || amount.is_a?(Float)
    fail 'Insufficient funds' if amount > @transaction_history.last.balance || new_account?
  end

  def new_account?
    @transaction_history.empty?
  end

end
