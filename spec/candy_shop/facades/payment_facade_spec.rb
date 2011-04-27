require 'spec_helper'

class CandyShop::Payments::Plans::Test; end

describe CandyShop::Facades::PaymentFacade do

  let(:error_class) { CandyShop::Facades::PaymentFacade::PaymentError }
  let(:algorithm)   { CandyShop::Payments::Plans::Test }

  let(:plan) { 'test' }
  let(:customer) { Factory(:customer) }
  let(:options) { { :plan => plan, :customer_id => customer.id } }



  context "api" do
    it { should respond_to :create }
  end

  context ".create" do
    context "errors" do
      it "should raise PaymentError with no params" do
        lambda { subject.create }.should raise_error(ArgumentError)
      end

      it "should raise PaymentError if :plan undefined" do
        lambda { subject.create(options.except(:plan)) }.should raise_error(error_class, "Unable to find payment method nil")
      end

      it "should raise PaymentError if :customer undefined" do
        lambda { subject.create(options.except(:customer_id)) }.should raise_error(error_class, "Unable to find customer with ID=nil")
      end

      it "should raise PaymentError if :customer not found" do
        lambda { subject.create(options.merge(:customer_id => 0)) }.should raise_error(error_class, "Unable to find customer with ID=0")
      end
    end

    context "result" do
      before {
        algorithm.should_receive(:apply).with(customer).and_return('participation')
      }

      subject { described_class.new.create(options) }

      it { should == 'participation' }
    end
  end

end
