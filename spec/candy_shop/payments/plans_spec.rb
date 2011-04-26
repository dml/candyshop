require 'spec_helper'

RSpec::Matchers.define :have_strategies do |sample|
  match do |actual|
    similar?(sample.map{|a| a.to_sym}, actual)
  end
  def similar?(a, b)
    a.sort == b.sort
  end
end



shared_examples_for "a payment plan" do
  subject { described_class }
  its(:fee) { should == fee }
  its(:strategies) { should have_strategies(strategies) }
end



describe CandyShop::Payments::Plans::Free do
  let(:fee) { 0.00 }
  let(:strategies) { %w{ registration base_knowledge } }
  it_behaves_like "a payment plan"
end

describe CandyShop::Payments::Plans::D5 do
  let(:fee) { 4.99 }
  let(:strategies) { %w{ registration advanced_knowledge base_knowledge snacks } }
  it_behaves_like "a payment plan"
end

describe CandyShop::Payments::Plans::D10 do
  let(:fee) { 9.99 }
  let(:strategies) { %w{ registration advanced_knowledge base_knowledge snacks talks } }
  it_behaves_like "a payment plan"
end

describe CandyShop::Payments::Plans::D20 do
  let(:fee) { 19.99 }
  let(:strategies) { %w{ registration advanced_knowledge base_knowledge snacks talks workshop } }
  it_behaves_like "a payment plan"
end
