require 'spec_helper'

describe Participation do

  let(:customer) { Factory(:customer) }

  context "clear object" do
    subject { described_class.new }
    it { should_not be_valid }
  end

  context "invalid object" do
    subject { described_class.new(:fee => 2.99) }
    it { should_not be_valid }
  end

  context "invalid object" do
    subject { described_class.new(:customer => customer) }
    it { should_not be_valid }
  end

  context "valid object" do
    subject { described_class.new(:customer => customer, :fee => 2.99) }
  
    it { should be_valid }
  end

end
