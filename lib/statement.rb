class Statement

  def initialize(transactions)
    @transactions = transactions
  end

  def print
    display = []
    index = 0
    running_balance = 0.00
    @transactions.map do |date, amount|
      running_balance += amount
      if transactions.values[index].positive?
        display.push("#{transactions.keys[index].split(" ")[0]} || #{transactions.values[index]} || || #{running_balance}")
        display.push("
          ")
      else
        display.push("#{transactions.keys[index].split(" ")[0]} || || #{-transactions.values[index]} || #{running_balance}")
        display.push("
          ")
      end
      index += 1
    end
    "date || credit || debit || balance
        " + display.join
  end

end