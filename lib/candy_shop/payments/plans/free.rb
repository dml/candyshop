module CandyShop
  module Payments
    module Plans
      class Free < Base
        strategy [ :registration, :base_knowledge ], :fee => 0.00
      end
    end
  end
end
