require 'spec_helper'

class CandyShop::Facades::TestFacade; end

describe CandyShop::Facade do

  let(:subsystem_class) { CandyShop::Facades::TestFacade }
  let(:params) { {:param => 'test'} }

  context "subsystem errors" do
    it "should raise exception" do
      lambda {
        described_class.create('WrongName')
      }.should raise_error(CandyShop::Facade::FacadeError)
    end
  end

  context "existing subsystem facade" do
    before(:each) do
      @subsystem_facade = subsystem_class.new
      subsystem_class.stub(:new).and_return(@subsystem_facade)
    end

    it "should send message to subsystem" do
      @subsystem_facade.should_receive(:create).with(params).and_return(true)
      described_class.create('Test', params)
    end

    it "should send message to subsystem without params" do
      @subsystem_facade.should_receive(:create).with(no_args()).and_return(true)
      described_class.create('Test')
    end
  end

end
