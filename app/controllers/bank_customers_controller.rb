class BankCustomersController < ApplicationController
  def index
    @bank_customers = BankCustomer.all
  end
end