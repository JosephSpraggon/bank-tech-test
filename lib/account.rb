# frozen_string_literal: true

require_relative 'statement'

# Account class that handles the transactions
class Account
  attr_reader :transactions

  def initialize
    @transactions = {}
  end

  def deposit(amount)
    @date = Time.now.strftime('%d/%m/%Y %H:%M:%S')
    @transactions[@date] = amount
  end

  def withdraw(amount)
    @date = Time.now.strftime('%d/%m/%Y %H:%M:%S')
    @transactions[@date] = -amount
  end

  def print_statement
    statement = Statement.new(@transactions)
    puts statement.print
    statement.print
  end
end
