require 'spec_helper'

describe CandyShop::Payments::Strategies::RefundStrategy do

  let(:error_class) { CandyShop::Facades::PaymentFacade::PaymentError }
  let(:customer) { Factory(:customer, :deposit => deposit) }
  let(:options) { { :fee => fee } }

  context "when enough money" do
    let(:deposit) { 10.99 }
    let(:fee) { 0.99 }

    subject { described_class.apply(customer, options) }

    it { should be_true }
  end

  context "when no money and free plan" do
    let(:deposit) { 0.00 }
    let(:fee) { 0.00 }

    subject { described_class.apply(customer, options) }

    it { should be_true }
  end

  context "when not enough money" do
    let(:deposit) { 0.99 }
    let(:fee) { 10.99 }

    subject { lambda { described_class.apply(customer, options) } }

    it { should raise_error(error_class) }
  end

end
