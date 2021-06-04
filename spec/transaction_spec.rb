require 'transaction'

describe Transaction do
  let(:transaction) { Transaction.new(time: Time.now, type: :deposit, amount: 500, balance: 1500) }

  it 'can return transaction details through hash keys' do
    expect(transaction.time.strftime('%d/%m/%Y')).to eq Time.now.strftime('%d/%m/%Y')
    expect(transaction.amount).to eq 500
    expect(transaction.type).to eq :deposit
    expect(transaction.balance).to eq 1500
  end

end
