class ParticipationsController < ApplicationController

  def create
    @participation = CandyShop::Facade.create('Payment', params)
  rescue PaymentError => e
    redirect_to "welcome#index", :error => "Payment error. Reason: #{e.to_s}"
  end

end
