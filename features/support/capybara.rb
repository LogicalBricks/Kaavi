require 'draper/test/rspec_integration' if defined?(RSpec) && RSpec.respond_to?(:configure)

Capybara.javascript_driver = :webkit

After do |escenario| 
  Capybara.save_and_open_page if escenario.failed?
end
 
`rm -rf capybara*.html`
