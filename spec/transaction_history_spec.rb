require 'transaction_history'

describe TransactionHistory do
  let(:deposit_double) {double(:transaction, time: Time.now, amount: 500, balance: 1500) }
  let(:withdrawal_double) {double(:transaction, time: Time.now, amount: -500, balance: 500) }

  it 'can add a transaction' do
   subject.add_transaction(deposit_double)
   expect(subject.transactions.first).to be deposit_double
  end

  it 'can store deposite and withdrawal transactions' do
    subject.add_transaction(deposit_double)
    subject.add_transaction(withdrawal_double)

    expect(subject.transactions.first).to be deposit_double
    expect(subject.transactions.last).to be withdrawal_double
  end

end
