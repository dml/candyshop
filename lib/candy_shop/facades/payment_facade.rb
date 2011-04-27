class CandyShop::Facades::PaymentFacade
  class PaymentError < StandardError; end

  def create(params)
    algorithm = CandyShop::Payments::Plans.const_get(params[:plan].classify)
    customer = Customer.find(params[:customer_id])
    algorithm.apply(customer)
  rescue NameError => e
    raise PaymentError, "Unable to find payment method #{params[:plan].inspect}"
  rescue ActiveRecord::RecordNotFound => e
    raise PaymentError, "Unable to find customer with ID=#{params[:customer_id].inspect}"
  rescue CandyShop::Payments::Plans::Base::PlansError => e
    raise PaymentError, "Unable to process payment. Reason: #{e.to_s}"
  end
end
