require 'account'

describe Account do
  
  context '#deposit' do

    it 'can deposit funds' do
      expect(subject.balance).to eq 0
      expect(subject.deposit(500)).to eq 500
    end
   
  end

end
