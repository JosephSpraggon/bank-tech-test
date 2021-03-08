class Account
  attr_reader :balance, :statement

  def initialize(balance = 0)
    @balance = balance
    @statement = {}
  end

  def deposit(amount)
    date = Time.now.strftime("%d/%m/%Y")
    @statement.store(date, amount)
    @balance += amount
  end

  def withdraw(amount)
    date = Time.now.strftime("%d/%m/%Y")
    @statement.store(date, -amount)
    @balance -= amount
  end

end