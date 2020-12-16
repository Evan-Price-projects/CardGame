
Given /^I am on the login page$/ do
  visit login_path
end

Given /^I have an account$/ do
  visit new_user_path
  fill_in 'Name', :with => "John"
  fill_in 'Password', :with => "Doe"
  click_button 'Create my Account'
end

When /^I have entered username "(.*?)" and password "(.*?)"$/ do |username, password|
  fill_in 'Name', :with => username
  fill_in 'Password', :with => password
  click_button 'Login to my account'
end

Then /^I should get a message$/ do
  expect(page).to have_content("Sorry. Incorrect Name or Password")
end

Then /^I should be redirected to the lobby$/ do
  expect(page).to have_content("All Games")
end