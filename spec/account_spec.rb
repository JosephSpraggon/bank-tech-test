require 'account'

describe Account do

  it 'can create an account object' do
    expect(subject).to be_an_instance_of(Account)
  end

  it 'a new account object has default balance of zero' do
    expect(subject.balance).to eq(0)
  end

end