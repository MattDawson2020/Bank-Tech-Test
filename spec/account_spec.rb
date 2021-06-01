require 'account'

describe Account do
  let(:subject) {Account.new(1000)}
  
  context '#deposit' do

    it 'can deposit funds' do
      expect(subject.balance).to eq 1000
      expect(subject.deposit(500)).to eq 1500
    end
  end

  context '#withdraw' do

    it 'can withdraw funds' do
      expect(subject.balance).to eq 1000
      expect(subject.withdraw(500)).to eq 500
    end
  end

end
