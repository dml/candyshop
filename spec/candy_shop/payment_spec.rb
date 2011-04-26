require 'spec_helper'

describe CandyShop::Payment do

  it { respond_to :apply_plan }

  let(:object) { Class.new }
  let(:plan) { 'free' }

  context "payment method error" do
    it "should raise exception" do
      lambda {
        described_class.apply_plan(object, 'noname')
      }.should raise_error(CandyShop::Payment::PaymentError)
    end
  end

  context "payment object error" do
    it "should raise error if wrong object type passed" do
      lambda {
        described_class.apply_plan(nil, 'Free')
      }.should raise_error(CandyShop::Payment::PaymentError)
    end
  end

end
