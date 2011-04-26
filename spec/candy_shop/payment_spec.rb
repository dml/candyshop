require 'spec_helper'

class CandyShop::Payments::Plans::Test; end

describe CandyShop::Payment do

  it { respond_to :apply_plan }

  let(:algorithm) { CandyShop::Payments::Plans::Test }
  let(:customer) { Factory(:customer) }
  let(:plan) { 'free' }

  context "payment method error" do
    it "should raise exception" do
      lambda {
        described_class.apply_plan(customer, 'noname')
      }.should raise_error(CandyShop::Payment::PaymentError)
    end
  end

  context "cusomer object error" do
    before { algorithm.stub!(:apply).and_return(true) }

    it "should raise error if wrong object type passed" do
      lambda {
        described_class.apply_plan(nil, :Test)
      }.should raise_error(CandyShop::Payment::PaymentError)
    end

    it "should find Customer by id" do
      lambda {
        described_class.apply_plan(customer.id, :Test)
      }.should_not raise_error
    end

    it "should use Customer instance" do
      lambda {
        described_class.apply_plan(customer, :Test)
      }.should_not raise_error
    end
  end

end
