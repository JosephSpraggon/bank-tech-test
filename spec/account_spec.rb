require 'account'

describe Account do

  it 'can create an account object' do
    expect(subject).to be_an_instance_of(Account)
  end

end