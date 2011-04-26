require 'spec_helper'

class CandyShop::Payments::Plans::Test; end

describe CandyShop::Facades::Payment do

  let(:error_class) { CandyShop::Facades::Payment::PaymentError }
  let(:algorithm) { Payments::Plans::Test }

  let(:plan) { 'test' }
  let(:customer) { Factory(:customer) }
  let(:options) { { :plan => plan, :customer_id => customer.id } }

  let(:facade_class) { Class.new.tap { |c| c.extend described_class } }

  subject { facade_class }

  context "api" do
    it { should respond_to :create }
  end

  context ".create" do
    context "errors" do
      it "should raise PaymentError with no params" do
        lambda { subject.create }.should raise_error(error_class)
      end

      it "should raise PaymentError if :plan undefined" do
        lambda { subject.create(options.except(:plan)) }.should raise_error(error_class)
      end

      it "should raise PaymentError if :customer undefined" do
        lambda { subject.create(options.except(:customer_id)) }.should raise_error(error_class)
      end

      it "should raise PaymentError if :customer not found" do
        lambda { subject.create(options.merge(:customer_id => 0)) }.should raise_error(error_class)
      end
    end

    context "result" do
      before { facade_class.should_receive(:create).and_return('partisipation') }

      subject { facade_class.create(options) }

      it { should == 'partisipation' }
    end
  end

end
