require 'spec_helper'

describe CandyShop::Facades::CustomerFacade do

  context "get" do
    before { Factory(:customer) }

    let(:customer) { Customer.last }

    subject { described_class.new.get({}) }

    it { should == customer }
  end

end
