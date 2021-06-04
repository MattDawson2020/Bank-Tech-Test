class Account

  attr_reader :transaction_history

  def initialize()
    @transaction_history = []
  end

  def balance
    @transaction_history.empty? ? 0 : @transaction_history.last.balance
  end

  def deposit(amount)
    validate_deposit(amount)
    new_balance = calculate_deposit(amount)
    @transaction_history << (Transaction.new(time: Time.now, type: :deposit, amount: amount, balance: new_balance))
  end

  def withdraw(amount)
    validate_withdrawal(amount)
    new_balance = calculate_withdrawal(amount)
    @transaction_history <<(Transaction.new(time: Time.now, type: :withdrawal, amount: amount, balance: new_balance))
  end

  private

  def validate_deposit(amount)
    fail 'Invalid input type, please deposit numeric currency' unless amount.is_a?(Integer) || amount.is_a?(Float)
  end

  def validate_withdrawal(amount)
    fail 'Invalid withdrawal request, please withdraw numeric currency' unless amount.is_a?(Integer) || amount.is_a?(Float)
    fail 'Insufficient funds' if amount > @transaction_history.last.balance || @transaction_history.empty?
  end

  def calculate_deposit(amount)
    old_balance = @transaction_history.empty? ? 0 : @transaction_history.last.balance 
    return old_balance += amount
  end

  def calculate_withdrawal(amount)
    old_balance = @transaction_history.last.balance
    return old_balance -= amount
  end

end
