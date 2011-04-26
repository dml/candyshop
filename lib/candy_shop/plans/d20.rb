module CandyShop
  module Plans
    class D20 < Base
      strategy [ :registration, :advanced_knowledge, :base_knowledge, :snacks, :talks, :workshop ], :fee => 19.99
    end
  end
end