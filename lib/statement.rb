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
    @transactions.values[@index].positive?
  end

  def add_deposit
    @display.push("#{@transactions.keys[@index].split(" ")[0]} || #{@transactions.values[@index]} || || #{@running_balance}")
    @display.push("
    ")
  end

  def add_withdraw
    @display.push("#{@transactions.keys[@index].split(" ")[0]} || || #{-@transactions.values[@index]} || #{@running_balance}")
    @display.push("
    ")
  end

end