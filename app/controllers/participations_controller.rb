class ParticipationsController < ApplicationController

  def show
    @participation = CandyShop::Facade.get('Participation', params)
  end

  def create
    redirect_to CandyShop::Facade.create("Payment", params), :notice => 'Participation successfuly created'
  rescue CandyShop::Facades::PaymentFacade::PaymentError => e
    redirect_to root_path, :alert => "Payment error. Reason: #{e.to_s}"
  end

end
