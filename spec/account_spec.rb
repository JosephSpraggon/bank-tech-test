require 'account'

describe Account do

  let(:test_account) {Account.new(500)}

  it 'can create an account object' do
    expect(subject).to be_an_instance_of(Account)
  end

  it 'a new account object has default balance of zero' do
    expect(subject.balance).to eq(0)
  end

  context '#deposit' do

    it 'can add an amount to the balance' do
      subject.deposit(500)
      expect(subject.balance).to eq(500)
    end

  end

  context '#withdraw' do 

    it 'can minus an amount from the balance' do
      test_account.withdraw(100)
      expect(test_account.balance).to eq(400)
    end

  end

end