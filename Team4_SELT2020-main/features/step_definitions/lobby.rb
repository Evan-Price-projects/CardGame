
Given /^I am on the lobby page$/ do
  visit new_user_path
  fill_in 'Name', :with => "John"
  fill_in 'Password', :with => "Doe"
  click_button 'Create my Account'

  visit login_path
  fill_in 'Name', :with => "John"
  fill_in 'Password', :with => "Doe"
  click_button 'Login to my account'

  visit tables_path
end

Given /^I am on the lobby page with game created$/ do
  visit new_user_path
  fill_in 'Name', :with => "John"
  fill_in 'Password', :with => "Doe"
  click_button 'Create my Account'

  visit login_path
  fill_in 'Name', :with => "John"
  fill_in 'Password', :with => "Doe"
  click_button 'Login to my account'

  visit tables_path

  click_link('Add new Game')

  fill_in 'Table Name', :with => "Table1"
  click_button("Save Changes")

  visit tables_path
end

When /^I have clicked to create a new game or table$/ do
  click_link('Add new Game')
end

When /^I enter and submit "(.*?)"$/ do |table_name|
  fill_in 'Table Name', :with => table_name
  click_button("Save Changes")
end

Then /^I should be redirected to the create new game page$/ do
  expect(page).to have_content("Create New Table")
end

Then /^I should be able to start the game$/ do
  expect(page).to have_content("Tablename")
end

When /^I have clicked to join game$/ do
  click_button("Enter Game")
end

Then /^I should be redirected to the game table$/ do
  expect(page).to have_content("Current Lobby: Table1")
end
