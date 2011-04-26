module CandyShop
  module Payments
    module Plans
      class D5 < Base
        strategy [ :registration, :advanced_knowledge, :base_knowledge, :snacks ], :fee => 4.99
      end
    end
  end
end