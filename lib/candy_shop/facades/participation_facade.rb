class CandyShop::Facades::ParticipationFacade
  class ParticipationError < StandardError; end

  def get(params)
    Participation.find(params[:id])
  end
end
