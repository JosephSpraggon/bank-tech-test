# frozen_string_literal: true

require_relative 'statement'
require_relative 'transaction'

# Account class that handles the transactions
class Account
  attr_reader :transactions

  def initialize
    @transactions = {}
  end

  def deposit(amount)
    deposit_transaction(amount)
  end

  def withdraw(amount)
    withdraw_transaction(amount)
  end

  def print_statement
    statement = Statement.new(@transactions)
    puts statement.print
    statement.print
  end

  private

  def deposit_transaction(amount)
    @date = Time.now.strftime('%d/%m/%Y %H:%M:%S')
    @transactions[@date] = amount
  end

  def withdraw_transaction(amount)
    @date = Time.now.strftime('%d/%m/%Y %H:%M:%S')
    @transactions[@date] = -amount
  end
end
