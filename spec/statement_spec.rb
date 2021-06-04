require 'statement'

describe Statement do

    let(:past_transaction) { double(:transaction, time: DateTime.new(2012, 1, 10),
                                               amount: 1000, 
                                               balance: 1000) }

    let(:decimal_double) { double(:transaction, time: Time.now, 
                                                amount: 1000.95, 
                                                balance: 2000.95) }                                         

    let(:recent_transaction) { double(:transaction, time: Time.now, 
                                                       amount: -500, 
                                                       balance: 1500.95) }
                                                      

    let(:account) { double(:account, balance: 1000, transaction_history: []) }
    let(:subject) { Statement.new(account) }
  
    it 'can print a statement with matching data' do
      subject.account.transaction_history << past_transaction
      subject.account.transaction_history << decimal_double
      subject.account.transaction_history << recent_transaction
    
  
      expect($stdout).to receive(:puts).with(
        "Date  ||  Credit  ||  Debit  ||  Balance\n" \
        "#{Time.now.strftime('%d/%m/%Y')} || || 500.00 || 1500.95\n" \
        "#{Time.now.strftime('%d/%m/%Y')} || 1000.95 || || 2000.95\n"  \
        "10/01/2012 || 1000.00 || || 1000.00" 
      )
      subject.print_statement
    end

end
