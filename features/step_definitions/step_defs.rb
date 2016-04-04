When /^I visit '(.+)'$/ do |url|
  visit url
end

Then /^I should see the page title '(.+)'$/ do |title|
  expect(page).to have_css('h1', text: title)
end

And /^I should see an image of the meal$/ do 
  expect(page).to have_css('img')
end

And /^I should see text '(.+)'$/ do |text|
  expect(page).to have_content(text)
end

Then /^I should see a list of recipes$/ do
  expect(page).to have_css('#recipes ul li .recipe', minimum: 1)
end