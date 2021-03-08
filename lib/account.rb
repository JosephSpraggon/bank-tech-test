class Account
  attr_reader :balance, :statement

  def initialize(balance = 0.00)
    @balance = balance
    @statement = {}
  end

  def deposit(amount)
    date = Time.now.strftime("%d/%m/%Y %H:%M:%S")
    @statement[date] = amount
    @balance += amount
  end

  def withdraw(amount)
    date = Time.now.strftime("%d/%m/%Y %H:%M:%S")
    @statement[date] = -amount
    @balance -= amount
  end

  def print
    
    "date || credit || debit || balance
        #{"date"} || || 500.00 || 500.00"
  end

end