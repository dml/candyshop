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
        end



        # Chain of Responsibilities
        def apply(customer)
          self.class.strategies.each do |strategy|
            
          end
        end

      end
    end
  end
end
