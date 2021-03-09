# frozen_string_literal: true

# Testing this one out
class Transaction
  def deposit_transaction(amount)
    @date = Time.now.strftime('%d/%m/%Y %H:%M:%S')
    @transactions[@date] = amount
  end
end
