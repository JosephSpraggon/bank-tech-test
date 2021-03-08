require 'account'

describe Account do

  let(:test_account) {Account.new(500.00)}

  it 'can create an account object' do
    expect(subject).to be_an_instance_of(Account)
  end

  it 'a new account object has default balance of zero' do
    expect(subject.balance).to eq(0.00)
  end

  it 'can store multiple transactions in the statement' do
    allow(Time).to receive_message_chain(:now, :strftime).and_return("date1", "date2")

    subject.deposit(500.00)
    subject.withdraw(100.00)
    expect(subject.statement).to eq("date1" => 500.00, "date2" => -100.00)
  end

  context '#deposit' do

    it 'can add an amount to the balance' do
      subject.deposit(500.00)
      expect(subject.balance).to eq(500.00)
    end

    it 'stores the date of the deposit in the statement' do
      allow(Time).to receive_message_chain(:now, :strftime ).and_return("date")

      subject.deposit(500.00)
      expect(subject.statement).to eq("date" => 500.00)
    end

  end

  context '#withdraw' do 

    it 'can minus an amount from the balance' do
      test_account.withdraw(100.00)
      expect(test_account.balance).to eq(400.00)
    end

    it 'stores the date of the withdrawl in the statement' do
      allow(Time).to receive_message_chain(:now, :strftime ).and_return("date")
      test_account.withdraw(100.00)
      expect(test_account.statement).to eq("date" => -100.00)
    end

  end

  context '#print' do

    it 'can print one transaction in the correct format' do
      allow(Time).to receive_message_chain(:now, :strftime ).and_return("date")

      subject.deposit(500.00)
      expect(subject.print).to eq("date || credit || debit || balance
        #{"date"} || || 500.00 || 500.00")
    end

  end

end