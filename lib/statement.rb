require 'date'

class Statement 
  attr_reader :account

  def initialize(account)
    @account = account
  end

  def print_statement
    puts "Date  ||  Credit  ||  Debit  ||  Balance\n" +
    @account.transaction_history.transactions.reverse.map { |transaction| format_transaction(transaction) }.join("\n")
  end


  private 

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
