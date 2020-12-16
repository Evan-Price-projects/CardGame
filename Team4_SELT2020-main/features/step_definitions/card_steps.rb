
Given /^I am on the game board$/ do
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

  click_button("Enter Game")
end

When /^I click the Select Card button$/ do
  visit cards_path
  click_on "Select"
end

Then /^I should have another card in my hand$/ do
  expect(page).to have_content("Selected card placed in user hand")
end

When /^I click on the Move Card button$/ do
  visit cards_path
  click_on "Move"
end

Then /^I should see card moved$/ do
  expect(page).to have_content("recard")
end

When /^I click on the Recover Discard button$/ do
  visit cards_path
  click_on "Recover Discard"
end

Then /^I should see all discarded cards recovered$/ do
  expect(page).to have_content("Discarded Cards Recovered")
end

When /^I click on the Pass button$/ do
  visit cards_path
  click_on "Pass"
end

Then /^I should see message telling me I cannot do this$/ do
  expect(page).to have_content("Card(s) not passed")
end

When /^I click the End Game button$/ do
  visit cards_path
  click_on "Leave Game"
end