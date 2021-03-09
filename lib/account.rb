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
    display = []
    index = 0
    running_balance = 0.00
    @statement.map do |date, amount|
      running_balance += amount
      if statement.values[index].positive?
        display.push("#{statement.keys[index]} || #{statement.values[index]} || || #{running_balance}")
        display.push("
          ")
      else
        display.push("#{statement.keys[index]} || || #{-statement.values[index]} || #{running_balance}")
        display.push("
          ")
      end
      index += 1
    end
    "date || credit || debit || balance
        " + display.join
  end

end