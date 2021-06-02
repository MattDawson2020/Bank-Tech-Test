require 'statement'

describe Statement do

  context '#print_statement' do
    let(:transaction_1) { double(:transaction, time: DateTime.new(2012, 1, 10), type: :deposit, amount: 1000, balance: 1000) }
    let(:transaction_2) { double(:transaction, time: DateTime.new(2012, 1, 13), type: :deposit, amount: 2000, balance: 3000) }
    let(:transaction_3) { double(:transaction, time: DateTime.new(2012, 1, 14), type: :withdrawal, amount: 500, balance: 2500) }

    let(:current_date_double_1) { double(:transaction, time: Time.now, type: :deposit, amount: 1000, balance: 1000) }
    let(:current_date_double_2) { double(:transaction, time: Time.now, type: :deposit, amount: 2000, balance: 3000) }
    let(:current_date_double_3) { double(:transaction, time: Time.now, type: :withdrawal, amount: 500, balance: 2500) }

    let(:decimal_double_1) { double(:transaction, time: Time.now, type: :deposit, amount: 1000.95, balance: 1000.95) }
    let(:decimal_double_2) { double(:transaction, time: Time.now, type: :deposit, amount: 2000.95, balance: 3001.90) }
    let(:decimal_double_3) { double(:transaction, time: Time.now, type: :withdrawal, amount: 500.67, balance: 2501.23) }
    # Was going to combine current date and decimal doubles to trim this page down, but I decied against this as it violates SRP

    let(:transaction_history) { double(:transaction_history, transactions: []) }
    let(:account) { double(:account, balance: 1000, transaction_history: transaction_history)}
    let(:subject) { Statement.new(account)}
  
    it 'can print a statement with current dates' do
      subject.account.transaction_history.transactions << current_date_double_1
      subject.account.transaction_history.transactions << current_date_double_2
      subject.account.transaction_history.transactions << current_date_double_3
  
      expect(STDOUT).to receive(:puts).with(
        "Date  ||  Credit  ||  Debit  ||  Balance\n" +
        "#{Time.now.strftime("%d/%m/%Y")} || || 500.00 || 2500.00\n"  +
        "#{Time.now.strftime("%d/%m/%Y")} || 2000.00 || || 3000.00\n" +
        "#{Time.now.strftime("%d/%m/%Y")} || 1000.00 || || 1000.00"
      )
      subject.print_statement
    end
  
    it 'can correctly calculates decimal inputs' do
      
      subject.account.transaction_history.transactions << decimal_double_1
      subject.account.transaction_history.transactions << decimal_double_2
      subject.account.transaction_history.transactions << decimal_double_3
  
      expect(STDOUT).to receive(:puts).with(
        "Date  ||  Credit  ||  Debit  ||  Balance\n" +
        "#{Time.now.strftime("%d/%m/%Y")} || || 500.67 || 2501.23\n"  +
        "#{Time.now.strftime("%d/%m/%Y")} || 2000.95 || || 3001.90\n" +
        "#{Time.now.strftime("%d/%m/%Y")} || 1000.95 || || 1000.95"
      )
      subject.print_statement
    end
  
    it 'can give us the desired output with dates in the past' do
      subject.account.transaction_history.transactions << transaction_1
      subject.account.transaction_history.transactions << transaction_2
      subject.account.transaction_history.transactions << transaction_3
  
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
