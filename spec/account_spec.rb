require 'account'

describe Account do
  let(:subject) {Account.new(1000.00)}
  
  context '#deposit' do

    it 'can deposit funds' do
      expect(subject.balance).to eq 1000.00
      subject.deposit(500.00)
      expect(subject.balance).to eq 1500.00
    end

    it 'creates and stores stores a deposit transaction in transaction_history' do
      subject.deposit(500.00)
      transaction = subject.transaction_history.transactions.first
      expect(transaction.amount).to eq 500.00
      expect(transaction.balance).to eq 1500.00
    end

  end

  context '#withdraw' do

    it 'can withdraw funds' do
      expect(subject.balance).to eq 1000.00
      subject.withdraw(500.00)
      expect(subject.balance).to eq 500.00
    end


    it 'creates and stores a withdrawal transaction in transaction_history' do
      subject.withdraw(500.00)
      transaction = subject.transaction_history.transactions.first
      expect(transaction.amount).to eq 500.00
      expect(transaction.balance).to eq 500.00
    end

  end

  context '#transaction_history' do
    
    it 'injects a transaction history object' do
      expect(subject.transaction_history).to be_instance_of TransactionHistory
    end

  end


  context '#print_statement' do
    let(:transaction_1) { double(:transaction, time: DateTime.new(2012, 1, 10), type: :deposit, amount: 1000.00, balance: 1000.00) }
    let(:transaction_2) { double(:transaction, time: DateTime.new(2012, 1, 13), type: :deposit, amount: 2000.00, balance: 3000.00) }
    let(:transaction_3) { double(:transaction, time: DateTime.new(2012, 1, 14), type: :withdrawal, amount: 500.00, balance: 2500.00) }

    it 'can print a statement' do
      subject = Account.new
      subject.deposit(1000.00)
      subject.deposit(2000.00)
      subject.withdraw(500.00)
  
      expect(STDOUT).to receive(:puts).with(
        "Date  ||  Credit  ||  Debit  ||  Balance\n"  +
        "01/06/2021 || || 500.00 || 2500.00\n"  +
        "01/06/2021 || 2000.00 || || 3000.00\n" +
        '01/06/2021 || 1000.00 || || 1000.00'
      )

      subject.print_statement
    end

    it 'can give us the desired output with doubles mocking the correct dates' do
      subject.transaction_history.transactions << transaction_1
      subject.transaction_history.transactions << transaction_2
      subject.transaction_history.transactions << transaction_3

      expect(STDOUT).to receive(:puts).with(
        "Date  ||  Credit  ||  Debit  ||  Balance\n"   +
        "14/01/2012 || || 500.00 || 2500.00\n"  +
        "13/01/2012 || 2000.00 || || 3000.00\n" +
        '10/01/2012 || 1000.00 || || 1000.00'
      )
      
      subject.print_statement
    end
   
  end

end
