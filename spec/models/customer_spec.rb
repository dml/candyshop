require 'spec_helper'

describe Customer do

  context "clear object" do
    subject { Customer.new }

    it { should_not be_valid }
  end

  context "clear object" do
    subject { Customer.new(:name => 'test one') }

    it { should be_valid }
  end

end
