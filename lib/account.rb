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
    date
    @transactions[@date] = -amount
    @balance -= amount
  end

  # def print_statement
  #   @statement = Statement.new(@transactions)
  #   puts @statement.print
  # end

  def print
    create_statement
    display_statement
  end



  private

  def deposit_transaction(amount)
    date
    @transactions[@date] = amount
    @balance += amount
  end

  def date
    @date = Time.now.strftime("%d/%m/%Y %H:%M:%S")
  end

  def create_statement
    create_statement_counters
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

  def create_statement_counters
    @display = []
    @index = 0
    @running_balance = 0.00
  end

  def display_statement
    "date || credit || debit || balance
        " + @display.join
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