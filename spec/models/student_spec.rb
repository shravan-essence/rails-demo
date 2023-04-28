require 'rails_helper'

#rspec spec/models/student_spec.rb --format documentation

RSpec.describe Student, type: :model do
	context 'when email is invalid' do
		it "checks that email is invalid" do
			student = Student.create(email: "chaudharysharw@an2000@gmail.com", password: "Shravan@123", role: "user")
			expect(student).to be_invalid
		end
	end

	context 'when email is invalid' do
		it 'checks that the email is invalid' do
			student = Student.create(email: "chaudharysharwan@gmail.com", password: "Shravan@123", role: "user")
			expect(student).to be_valid
		end
	end

	context 'when email is valid' do
		it 'checks that the email is valid' do
			student = Student.create(email: "chaudharysharwan2000@gmail.com", password: "Shravan@123", role: "user")
			expect(student).to be_valid
		end
	end

	context 'when password is invalid' do
		it "checks that the password is invalid" do
			student = Student.create(email: "chaudharysharwan2000@gmail.com", password: "shrav", role: "user")
			expect(student).to be_invalid
		end
	end

	context 'when password is valid' do
		it "checks that the password is valid" do
			student = Student.create(email: "chaudharysharwan2000@gmail.com", password: "shrava", role: "user")
			expect(student).to be_valid
		end
	end

	# context 'when role is invalid' do
	# 	it "checks that the role is invalid" do
	# 		student = Student.create(email: "chaudharysharwan2000@gmail.com", password: "shrava", role: "")
	# 		expect(student).to be_valid
	# 	end
	# end

	# context 'when role is valid' do
	# 	it "checks that the role is valid" do
	# 		student = Student.create(email: "chaudharysharwan2000@gmail.com", password: "shrava", role: "admin")
	# 		expect(student).to be_valid
	# 	end
	# end
end