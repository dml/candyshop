require 'spec_helper'

describe Customer do

  context "clear object" do
    subject { described_class.new }

    it { should_not be_valid }
  end

  context "valid object" do
    subject { described_class.new(:name => 'test one') }

    it { should be_valid }
  end

end
