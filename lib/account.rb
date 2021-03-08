class Account
  attr_reader :balance, :statement

  def initialize(balance = 0)
    @balance = balance
    @statement = {}
  end

  def deposit(amount)
    date = Time.now
    @statement.store(date, amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end

end