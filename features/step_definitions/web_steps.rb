Given /^I am on the home page$/ do
  visit root_path
end

##################################################

When /^I follow "([^"]*)"$/ do |link|
  click_link(link)
end

When /^I fill in the following:$/ do |fields|
  fields.rows_hash.each do |field, value|
    fill_in(field, :with => value)
  end
end

When /^I press "([^"]*)"$/ do |button|
  click_button(button)
end

When /^I refresh the page$/ do
  visit current_url
end

##################################################

Then /^I should see "([^"]*)"$/ do |text|
  page.should have_content(text)
end

Then /^I should not see "([^"]*)"$/ do |text|
  page.should_not have_content(text)
end

Then /^I should see the pings table:$/ do |expected_table|
  actual_table = tableish('#pings table tr', 'td,th')
  diff_tables!(actual_table, expected_table)
end