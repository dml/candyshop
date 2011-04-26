require 'spec_helper'

module CandyShop::Facades::Test; end


describe CandyShop::Facade do

  let(:subsystem_class) { CandyShop::Facades::Test }

  context "wrong subsystem facade" do
    it "should raise exception" do
      lambda {
        described_class.create('WrongName')
      }.should raise_error(CandyShop::Facade::FacadeError)
    end
  end

  context "existing subsystem facade" do
    it "should send message to subsystem" do
      subsystem_class.should_receive(:create).with('param')
      described_class.create('Test', 'param')
    end
  end

  context "existing subsystem facade without params" do
    it "should send message to subsystem without params" do
      subsystem_class.should_receive(:create).with()
      described_class.create('Test')
    end
  end

end
