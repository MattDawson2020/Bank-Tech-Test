require 'transaction'

describe Transaction do
  let(:deposit_transaction) {Transaction.new(time: Time.now, credit: 500, debit: nil, balance: 1500) }
  let(:withdraw_transaction) {Transaction.new(time: Time.now, credit: nil, debit: 500, balance: 500) }

  
  it 'can return transaction details through hash keys' do
    expect(deposit_transaction.time.strftime("%d-%m-%Y")).to eq Time.now.strftime("%d-%m-%Y")
    expect(deposit_transaction.credit).to eq 500
    expect(deposit_transaction.debit).to be_nil
    expect(deposit_transaction.balance).to eq 1500

    expect(withdraw_transaction.time.strftime("%d-%m-%Y")).to eq Time.now.strftime("%d-%m-%Y")
    expect(withdraw_transaction.credit).to be_nil
    expect(withdraw_transaction.debit).to eq 500
    expect(withdraw_transaction.balance).to eq 500
  end
end