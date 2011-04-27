module CandyShop
  module Payments
    module Plans
      class Base
        class PlansError < StandardError; end

        class << self
          attr_reader :strategies, :options

          def strategy(strategies, options = {})
            strategies = case strategies
              when Symbol
                [ strategies ]
              when Array
                strategies
              else
                raise PlansError, "Insufficient argunent list"
            end

            @strategies = strategies.map { |name| Payments::Strategies.const_get("#{name}_strategy".classify) }
            @options = { :fee => 0.00 }.merge(options)
          end

          def fee
            options.try(:[], :fee)
          end

          # Chain of Responsibilities
          def apply(customer)
            # TODO create responcibility
            # TODO create Facility model - facilities, in fact, is a operation logging
            # TODO list of strategies could be used as transaction, it could be reversed

            options = { :fee => fee }

            # facilities = []
            # strategies.each do |strategy|
            #   # facilities << strategy.apply(customer)
            # end

            Payments::Strategies::RefundStrategy.apply(customer, options)

            customer.participations.create(options)
          end
        end
      end
    end
  end
end
