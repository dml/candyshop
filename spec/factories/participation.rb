Factory.define :participation do |f|
  f.customer  Factory(:customer)
  f.fee       3.99
end
