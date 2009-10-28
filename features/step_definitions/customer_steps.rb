Given /^the following customers:$/ do |customers|
  customers.hashes.each do |customer|
    Factory(:customer, customer.symbolize_keys)
  end
end
