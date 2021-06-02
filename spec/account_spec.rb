require 'account'

describe Account do
  let(:subject) { Account.new(1000) }
  
  context '#deposit' do
    it 'can deposit funds' do
      expect(subject.balance).to eq 1000
      subject.deposit(500)
      expect(subject.balance).to eq 1500
    end

    it 'can deposit decimals' do
      subject.deposit(465.67)
      expect(subject.balance).to eq 1465.67
    end

    it 'creates and stores stores a deposit transaction in transaction_history' do
      subject.deposit(500)
      transaction = subject.transaction_history.transactions.first
      expect(transaction.amount).to eq 500
      expect(transaction.balance).to eq 1500
    end

    it 'only allows you to deposit integers or floats' do
      expect { subject.deposit("money") }.to raise_error "Invalid input type, please deposit numeric currency"
    end
    
    # The program already rejects string and other inputs automatically, but returns programatic type errors
    # I decided to overwrite these with more user friendly errors

  end

  context '#withdraw' do
    it 'can withdraw funds' do
      expect(subject.balance).to eq 1000
      subject.withdraw(500)
      expect(subject.balance).to eq 500
    end

    it 'creates and stores a withdrawal transaction in transaction_history' do
      subject.withdraw(500)
      transaction = subject.transaction_history.transactions.first
      expect(transaction.amount).to eq 500
      expect(transaction.balance).to eq 500
    end

    it 'prevents withdrawing insufficient funds' do
      expect { subject.withdraw(1001) }.to raise_error "Insufficient funds"
      
    end

    it 'only allows you to withdraw integers or floats' do
      expect { subject.withdraw("money") }.to raise_error "Invalid withdrawal request, please withdraw numeric currency"
    end

  end

  context '#transaction_history' do
    it 'injects a transaction history object' do
      expect(subject.transaction_history).to be_instance_of TransactionHistory
    end

  end

  context '#print_statement' do
    let(:transaction_1) { double(:transaction, time: DateTime.new(2012, 1, 10), type: :deposit, amount: 1000, balance: 1000) }
    let(:transaction_2) { double(:transaction, time: DateTime.new(2012, 1, 13), type: :deposit, amount: 2000, balance: 3000) }
    let(:transaction_3) { double(:transaction, time: DateTime.new(2012, 1, 14), type: :withdrawal, amount: 500, balance: 2500) }

    it 'can print a statement' do
      subject = Account.new
      subject.deposit(1000)
      subject.deposit(2000)
      subject.withdraw(500)
  
      expect(STDOUT).to receive(:puts).with(
        "Date  ||  Credit  ||  Debit  ||  Balance\n" +
        "#{Time.now.strftime("%d/%m/%Y")} || || 500.00 || 2500.00\n"  +
        "#{Time.now.strftime("%d/%m/%Y")} || 2000.00 || || 3000.00\n" +
        "#{Time.now.strftime("%d/%m/%Y")} || 1000.00 || || 1000.00"
      )
      subject.print_statement
    end

    it 'can correctly calculates decimals' do
      subject = Account.new
      subject.deposit(1000.95)
      subject.deposit(2000.95)
      subject.withdraw(500.67)
  
      expect(STDOUT).to receive(:puts).with(
        "Date  ||  Credit  ||  Debit  ||  Balance\n" +
        "#{Time.now.strftime("%d/%m/%Y")} || || 500.67 || 2501.23\n"  +
        "#{Time.now.strftime("%d/%m/%Y")} || 2000.95 || || 3001.90\n" +
        "#{Time.now.strftime("%d/%m/%Y")} || 1000.95 || || 1000.95"
      )
      subject.print_statement
    end

    it 'can give us the desired output with doubles mocking the correct dates' do
      subject.transaction_history.transactions << transaction_1
      subject.transaction_history.transactions << transaction_2
      subject.transaction_history.transactions << transaction_3

      expect(STDOUT).to receive(:puts).with(
        "Date  ||  Credit  ||  Debit  ||  Balance\n"  +
        "14/01/2012 || || 500.00 || 2500.00\n"  +
        "13/01/2012 || 2000.00 || || 3000.00\n" +
        '10/01/2012 || 1000.00 || || 1000.00'
      )
      subject.print_statement
    end
   
  end

end
