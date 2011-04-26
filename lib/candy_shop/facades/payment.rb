module CandyShop
  module Facades
    module Payment

      class PaymentError < StandardError; end

      def create(*params)
        algorithm = CandyShop::Payments::Plans.const_get(params[:plan].classify)
        customer = Customer.find(params[:customer_id])
        algorithm.apply(customer)
      rescue NameError => e
        raise PaymentError, "Can't find payment method #{params[:plan].inspect}"
      rescue ActiveRecord::RecordNotFound => e
        raise PaymentError, "Unable to find customer with ID : #{params[:customer_id].inspect}"
      rescue Exception => e
        raise PaymentError, "Unexcepted payment error. Reason: #{e.to_s}"
      end

    end
  end
end
