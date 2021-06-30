require 'app.rb'

describe 'Feature test' do
  let(:subject) { Account.new}

  it 'User can deposit, withdraw and get a statement' do
    
    expect(subject.balance).to be 0

    subject.deposit(1000)
    subject.deposit(1000.95)
    expect(subject.balance).to be 2000.95

    subject.withdraw(500)
    expect(subject.balance).to be 1500.95

    statement = Statement.new(subject)

    expect($stdout).to receive(:puts).with(
      "Date  ||  Credit  ||  Debit  ||  Balance\n" \
      "#{Time.now.strftime('%d/%m/%Y')} || || 500.00 || 1500.95\n" \
      "#{Time.now.strftime('%d/%m/%Y')} || 1000.95 || || 2000.95\n"  \
      "#{Time.now.strftime('%d/%m/%Y')} || 1000.00 || || 1000.00" 
    )
    statement.print_statement

  end

end