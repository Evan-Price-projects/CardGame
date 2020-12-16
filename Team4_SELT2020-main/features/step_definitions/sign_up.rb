
Given /^I am on the sign up page$/ do
  visit new_user_path
end

When /^I have to create a new account with username "(.*?)" and password "(.*?)"$/ do |username, password|
  fill_in 'Name', :with => username
  fill_in 'Password', :with => password
  click_button 'Create my Account'
end

Then /^I should be redirected to the login page for "(.*?)"$/ do |username|
  expect(page).to have_content("Welcome #{username}. Your account has been created.")
end