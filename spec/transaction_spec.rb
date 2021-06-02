require 'transaction'

describe Transaction do
  let(:deposit_transaction) { Transaction.new(time: Time.now, type: :deposit, amount: 500, balance: 1500) }
  let(:withdraw_transaction) { Transaction.new(time: Time.now, type: :withdrawal, amount: 500, balance: 500) }

  it 'can return deposit details through hash keys' do
    expect(deposit_transaction.time.strftime('%d/%m/%Y')).to eq Time.now.strftime('%d/%m/%Y')
    expect(deposit_transaction.amount).to eq 500
    expect(deposit_transaction.type).to eq :deposit
    expect(deposit_transaction.balance).to eq 1500
  end

  it 'can return withdrawal details through hash keys, and be identified with type' do
    expect(withdraw_transaction.time.strftime('%d/%m/%Y')).to eq Time.now.strftime('%d/%m/%Y')
    expect(withdraw_transaction.amount).to eq 500
    expect(withdraw_transaction.type).to eq :withdrawal
    expect(withdraw_transaction.balance).to eq 500
  end
end
