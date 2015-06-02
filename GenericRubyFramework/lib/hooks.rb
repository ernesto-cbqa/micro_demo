RSpec.configure do |config|
  
  config.include PageObject::PageFactory # gives access to visit_page method
  config.include HelperMethods
  
  config.before(:suite) do
  end
  
  config.before(:example) do
  end

  config.after(:example) do |example|
  end

  config.after(:context) do
  end

  config.after(:suite) do
  end
  
end
