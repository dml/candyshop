module CandyShop
  class Payment
    class PaymentError < StandardError; end

    def self.apply_plan(object, plan)

      begin
        algorithm = CandyShop::Payments::Plans.const_get(plan)
      rescue NameError => e
        raise PaymentError, "Can't find payment method"
      end

      customer = case object
        when Customer
          object
        when Integer
          Customer.find(object)
        else
          raise PaymentError, "Can't find payment actor"
      end

      algorithm.apply(customer)

    end

  end
end
