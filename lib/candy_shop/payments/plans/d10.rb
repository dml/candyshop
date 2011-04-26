module CandyShop
  module Payments
    module Plans
      class D10 < Base
        strategy [ :registration, :advanced_knowledge, :base_knowledge, :snacks, :talks ], :fee => 9.99
      end
    end
  end
end