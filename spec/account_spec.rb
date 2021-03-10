# frozen_string_literal: true

require 'account'

describe Account do
  it 'can create an account object' do
    expect(subject).to be_an_instance_of(Account)
  end

  it 'can store multiple transactions' do
    allow(Time).to receive_message_chain(:now, :strftime).and_return('date1', 'date2')

    subject.deposit(500.00)
    subject.withdraw(100.00)
    expect(subject.transactions).to eq('date1' => 500.00, 'date2' => -100.00)
  end

  context '#deposit' do
    it 'stores the date of the deposit' do
      allow(Time).to receive_message_chain(:now, :strftime).and_return('date')

      subject.deposit(500.00)
      expect(subject.transactions).to eq('date' => 500.00)
    end
  end

  context '#withdraw' do
    it 'stores the date of the withdrawl' do
      allow(Time).to receive_message_chain(:now, :strftime).and_return('date')
      subject.deposit(500.00)
      subject.withdraw(100.00)
      expect(subject.transactions).to eq('date' => -100.00)
    end
  end

  context '#print_statement' do
    it 'can print one deposit transaction in the correct format' do
      allow(Time).to receive_message_chain(:now, :strftime).and_return('date')

      subject.deposit(500.00)
      expect { subject.print_statement }.to output(
        "date || credit || debit || balance\ndate || 500.0 || || 500.0\n"
      ).to_stdout
    end

    it 'can print multiple deposit transactions in the correct format' do
      allow(Time).to receive_message_chain(:now, :strftime).and_return('date1', 'date2')

      subject.deposit(500.00)
      subject.deposit(100.00)
      expect { subject.print_statement }.to output(
        "date || credit || debit || balance\ndate1 || 500.0 || || 500.0\ndate2 || 100.0 || || 600.0\n"
      ).to_stdout
    end

    it 'can print withdraw transactions in the correct format' do
      allow(Time).to receive_message_chain(:now, :strftime).and_return('date1', 'date2')

      subject.deposit(500.00)
      subject.withdraw(200.00)
      expect { subject.print_statement }.to output(
        "date || credit || debit || balance\ndate1 || 500.0 || || 500.0\ndate2 || || 200.0 || 300.0\n"
      ).to_stdout
    end
  end
end
