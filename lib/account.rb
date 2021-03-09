require_relative 'statement'

class Account
  attr_reader :balance, :transactions

  def initialize(balance = 0.00)
    @balance = balance
    @transactions = {}
  end

  def deposit(amount)
    date = Time.now.strftime("%d/%m/%Y %H:%M:%S")
    @transactions[date] = amount
    @balance += amount
  end

  def withdraw(amount)
    date = Time.now.strftime("%d/%m/%Y %H:%M:%S")
    @transactions[date] = -amount
    @balance -= amount
  end

  # def print_statement
  #   @statement = Statement.new(@transactions)
  #   puts @statement.print
  # end

  def print
    @display = []
    @index = 0
    @running_balance = 0.00
    create_statement
    "date || credit || debit || balance
        " + @display.join
  end



  private

  def create_statement
    @transactions.map do |date, amount|
      @running_balance += amount
      if is_deposit?
        add_deposit
      else
        add_withdraw
      end
      @index += 1
    end
  end


  def is_deposit?
    transactions.values[@index].positive?
  end

  def add_deposit
    @display.push("#{transactions.keys[@index].split(" ")[0]} || #{transactions.values[@index]} || || #{@running_balance}")
    @display.push("
    ")
  end

  def add_withdraw
    @display.push("#{transactions.keys[@index].split(" ")[0]} || || #{-transactions.values[@index]} || #{@running_balance}")
    @display.push("
    ")
  end


end