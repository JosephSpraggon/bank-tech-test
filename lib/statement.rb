# frozen_string_literal: true

# Statement class that handles printing the statement
class Statement
  def initialize(transactions)
    @transactions = transactions
  end

  def print
    create_statement
    display_statement
  end

  private

  def create_statement
    statement_counters
    @transactions.map do |_date, amount|
      @balance += amount
      if deposit?
        add_deposit
      else
        add_withdraw
      end
      @index += 1
    end
  end

  def statement_counters
    @display = []
    @index = 0
    @balance = 0.00
  end

  def display_statement
    "date || credit || debit || balance\n#{@display.join}"
  end

  def deposit?
    @transactions.values[@index].positive?
  end

  def add_deposit
    @display.push(
      "#{@transactions.keys[@index].split(' ')[0]} || #{@transactions.values[@index]} || || #{@balance}\n"
    )
  end

  def add_withdraw
    @display.push(
      "#{@transactions.keys[@index].split(' ')[0]} || || #{-@transactions.values[@index]} || #{@balance}\n"
    )
  end
end
