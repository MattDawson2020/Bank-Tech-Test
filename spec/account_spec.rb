require 'account'

describe Account do
  let(:subject) {Account.new(1000)}
  
  context '#deposit' do

    it 'can deposit funds' do
      expect(subject.balance).to eq 1000
      subject.deposit(500)
      expect(subject.balance).to eq 1500
    end

    it 'creates and stores stores a deposit transaction in transaction_history' do
      subject.deposit(500)
      transaction = subject.transaction_history.transactions.first
      expect(transaction.credit).to eq 500
      expect(transaction.debit).to be_nil
      expect(transaction.balance).to eq 1500
    end

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
      expect(transaction.debit).to eq 500
      expect(transaction.credit).to be_nil
      expect(transaction.balance).to eq 500
    end

  end

  context '#transaction_history' do
    
    it 'injects a transaction history object' do
      expect(subject.transaction_history).to be_instance_of TransactionHistory
    end
    
  end

end
