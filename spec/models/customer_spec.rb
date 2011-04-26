require 'spec_helper'

describe Customer do

  let(:customer) { described_class.new }

  it { should validate_presence_of :name }
  it { should have_many :participations }

  subject { customer }

  context "new object" do
    it { should_not be_valid }
  end

  context "when name specified" do
    before { customer.name = 'test one' }
    it { should be_valid }
  end

end
