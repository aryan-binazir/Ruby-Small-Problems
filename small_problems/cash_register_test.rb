require 'minitest/autorun'

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @cash_register = CashRegister.new(100)
    @transaction = Transaction.new(20)
    @transaction.amount_paid = 20
  end

  def test_accept_money

    previous_amount = @cash_register.total_money
    @cash_register.accept_money(@transaction)
    current_amount = @cash_register.total_money

    assert_equal(previous_amount + 20, current_amount)
  end

  def test_change
    change = @transaction.amount_paid - @transaction.item_cost
    assert_equal(0, change)
  end

  def test_give_receipt
    assert_output("You've paid $#{@transaction.item_cost}.\n") do
      @cash_register.give_receipt(@transaction)
    end
  end
end