require 'spec_helper'

describe CandyShop::Facades::ParticipationFacade do

  context "get" do
    let(:participation) { Factory(:participation) }

    context "when right Id" do
      let(:params) { { :id => participation.id } }

      subject { described_class.new.get(params) }

      it { should == participation }
    end

    context "when wrong ID" do
      let(:params) { { :id => 0 } }

      subject { lambda { described_class.new.get(params) } }

      it { should raise_error(ActiveRecord::RecordNotFound) }
    end
  end

end
