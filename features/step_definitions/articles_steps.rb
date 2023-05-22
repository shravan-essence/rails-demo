Given /^I have articles titled (.+)$/ do |titles|
	titles.split(',').each do |title|
		book = Book.create!(title: "python", body: "Programming Language", owner: "shravan")
		Article.create!(title: title, body: "hadasdjasaaksdjakdja", published: true, book_id: book.id)
	end
end

When 'I go to the list of articles' do
	visit articles_path
end

Given 'I have no articles' do 
	Article.delete_all
end

Given 'I am on the list of articles' do 
	Article.all
end

Then 'I should see {string}' do |text|
	page.has_text?(text)
end

When /^I follow "New Article"$/ do 
	visit 'articles/new'
end

And('I fill in {string} with {string}') do |field, value|
  fill_in field, with: value
end


And('I check {string}') do |field|
  check field
end

And('I select {string} from {string}') do |option, field|
  select option, from: field
end

When('I click {string}') do |button_text|
  click_button button_text
end

Then('I should see {string} successfully created') do |article_title|
  expect(page).to have_content("#{article_title} successfully created")
end

Given 'I am logged in as {string} with password {string}' do |email, password|
	visit 'students/sign_in'
	fill_in 'student_email', with: email
  fill_in 'student_password', with: password
  click_button 'Log in'
end



