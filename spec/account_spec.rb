require 'account'

describe Account do
  let(:subject) {Account.new(1000)}
  
  context '#deposit' do

    it 'can deposit funds' do
      expect(subject.balance).to eq 1000
      subject.deposit(500)
      expect(subject.balance).to eq 1500
    end

    it 'creates a transaction when you deposit' do
      transaction = subject.deposit(500)
      expect(transaction).to be_instance_of transaction
      expect(transaction.credit).t0 eq 500
      expect(transaction.balance).to eq 1500
    end
  end

  context '#withdraw' do

    it 'can withdraw funds' do
      expect(subject.balance).to eq 1000
      subject.withdraw(500)
      expect(subject.balance).to eq 500
    end
  end

end
