class CandyShop::Facades::CustomerFacade
  class CustomerError < StandardError; end

  def get(params)
    Customer.last
  end
end
