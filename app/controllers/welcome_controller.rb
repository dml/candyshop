class WelcomeController < ApplicationController

  def index
    @customer = CandyShop::Facade.get('Customer', params)
  end

end
