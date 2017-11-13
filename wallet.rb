class Wallet
  attr_accessor :amount

  def initialize(amount_at_start)
    @amount = amount_at_start
  end

  def add(amount_to_add)
    @amount += amount_to_add
  end

  def subtract(amount_to_subract)
    @amount -= amount_to_subract
  end
end

