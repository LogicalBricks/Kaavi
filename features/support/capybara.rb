Capybara.javascript_driver = :webkit

After do |escenario| 
  Capybara.save_and_open_page if escenario.failed?
end
 
`rm -rf capybara*.html`
