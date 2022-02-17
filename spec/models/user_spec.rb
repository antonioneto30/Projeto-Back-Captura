require 'rails_helper'

RSpec.describe User, :type => :model do  	
	
	subject {
		described_class.new(name: "José", password_digest: "jose42", email: "jorge@gmail.com", cpf: "12075895792")
	}

	it 'is valid with valid attributes' do
		expect(subject).to be_valid
	end

	it 'is invalid with invalid password' do 
		subject.password_digest = 'eliaslol'
		expect(subject).to_not be_valid
	end

	it 'is invalid with nil password' do 
		subject.password_digest = nil
		expect(subject).to_not be_valid
	end

	it 'is invalid with nil email' do 
		subject.password_digest = "elias123"
		subject.email = nil
		expect(subject).to_not be_valid
	end

	it 'is invalid without a valid cpf' do 
		subject.cpf = "12312312354"
		expect(subject).to_not be_valid
	end

	it 'is invalid with nil cpf' do 
		subject.cpf = nil
		expect(subject).to_not be_valid
	end

	it 'is invalid without a unique email/cpf' do 
		user1 = FactoryBot.create(:user)
		user1.save
		user2 = FactoryBot.build(:user)
		expect(user2).to_not be_valid
	end

end