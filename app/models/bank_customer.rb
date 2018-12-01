class BankCustomer < ApplicationRecord
  validates_presence_of :name, :acc_no, :balance
  validates_uniqueness_of :acc_no
  validates_numericality_of :balance, greater_than_or_equal_to: 0

  def transact(amt,code)
    case code
    when 1
      self.balance += amt
      self.update_attributes(balance: self.balance)
    when 0
      self.balance -= amt
      self.update_attributes(balance: self.balance)
    else
      return "Invalid code"
    end
  end
end