require 'spec_helper'

describe ParticipationsController do
  describe "POST create" do

    let(:participation) { customer.participations.last }
    let(:customer) { Factory(:customer, :deposit => deposit) }

    context "does success" do
      let(:message) { "Participation successfuly created" }
      let(:location) { participation_path(participation) }

      before { post :create, :customer_id => customer.id, :plan => plan }

      context "when free plan" do
        let(:plan) { 'free' }
        let(:deposit) { 0.00 }

        specify { response.should redirect_to location }
        specify { flash[:notice].should == message }
      end

      context "when D5 plan" do
        let(:plan) { 'D5' }
        let(:deposit) { 5.99 }

        specify { response.should redirect_to location }
        specify { flash[:notice].should == message }
      end
    end



    context "does failure" do
      let(:location) { root_path }

      context "when wrong customer" do
        before { post :create, :customer_id => 0, :plan => 'free' }

        specify { response.should redirect_to location }
        specify { flash[:alert].should include("Unable to find customer") }
      end

      context "when wrong plan" do
        let(:deposit) { 5.99 }

        before { post :create, :customer_id => customer.id, :plan => 'freefree' }

        specify { response.should redirect_to location }
        specify { flash[:alert].should include("Unable to find payment method") }
      end

      context "when not enougth money" do
        let(:deposit) { 0.99 }

        before { post :create, :customer_id => customer.id, :plan => 'D5' }

        specify { response.should redirect_to location }
        specify { flash[:alert].should include("Not enough money") }
      end
    end

  end
end
