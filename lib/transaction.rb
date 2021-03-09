class Transaction

  def initialize
    @transactions = {}
  end

  def deposit(amount)
    @date = Time.now.strftime("%d/%m/%Y %H:%M:%S")
    @transactions[@date] = amount
  end


end