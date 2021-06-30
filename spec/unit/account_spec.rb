require 'account'

describe Account do
  
  context '#deposit' do
    it 'can deposit funds' do
      expect { subject.deposit(500) }.to change { subject.balance }.by(500)
    end

    it 'can deposit decimals and display as currency units' do
      subject.deposit(465.67)
      expect(subject.balance).to eq 465.67
    end

    it 'creates and stores stores a deposit transaction in transaction_history' do
      subject.deposit(500)
      transaction = subject.transaction_history.last
      expect(transaction.amount).to eq 500
      expect(transaction.balance).to eq 500
    end

    it 'only allows you to deposit integers or floats' do
      expect { subject.deposit('money') }.to raise_error 'Invalid input type, please deposit numeric currency'
      expect { subject.deposit([500]) }.to raise_error 'Invalid input type, please deposit numeric currency'
    end

  end

  context '#withdraw' do
    before do
      subject.deposit(1000)
    end

    it 'can withdraw funds' do
      expect { subject.withdraw(500) }.to change { subject.balance }.by(-500)
    end

    it 'creates and stores a withdrawal transaction in transaction_history' do
      subject.withdraw(500)
      transaction = subject.transaction_history.last

      expect(transaction.amount).to eq -500
      expect(transaction.balance).to eq 500
    end

    it 'prevents withdrawing insufficient funds' do
      expect { subject.withdraw(1001) }.to raise_error 'Insufficient funds'
    end

    it 'only allows you to withdraw integers or floats' do
      expect { subject.withdraw('money') }.to raise_error 'Invalid withdrawal request, please withdraw numeric currency'
      expect { subject.withdraw([500]) }.to raise_error 'Invalid withdrawal request, please withdraw numeric currency'
    end
  end

end
