require_relative 'statement'

class Account
  attr_reader :balance, :transactions

  def initialize(balance = 0.00)
    @balance = balance
    @transactions = {}
  end

  def deposit(amount)
    deposit_transaction(amount)
  end

  def withdraw(amount)
    withdraw_transaction(amount)
  end

  def print
    @statement = Statement.new(@transactions)
    @statement.print
  end



  private

  def deposit_transaction(amount)
    @date = Time.now.strftime("%d/%m/%Y %H:%M:%S")
    @transactions[@date] = amount
    @balance += amount
  end

  def withdraw_transaction(amount)
    @date = Time.now.strftime("%d/%m/%Y %H:%M:%S")
    @transactions[@date] = -amount
    @balance -= amount
  end


end