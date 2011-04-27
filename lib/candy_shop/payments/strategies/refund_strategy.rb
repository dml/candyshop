class CandyShop::Payments::Strategies::RefundStrategy
  def self.apply(customer, options = {})
    return true unless options[:fee] > 0.0

    raise CandyShop::Facades::PaymentFacade::PaymentError, "Not enough money" if customer.deposit < options[:fee]

    customer.deposit -= options[:fee]
    customer.save!
  end
end
