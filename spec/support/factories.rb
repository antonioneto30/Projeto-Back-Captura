FactoryBot.define do 
	factory :user do
		name {'teste'}
	    password_digest {'teste42'}
	    email {'teste@gmail.com'}
	    cpf {'124937584611'}
	    id {1}
	end

	factory :formulary do
		name {'forms'}
	end

	factory :question do 
		name {'question'}
		formulary_id {1}
		question_type {'text'}
	end

	factory :visit do 
		date {Date.new(2021,7,20)}
		status {'TRABALHANDO'}
		checkin_at {DateTime.new(2022,2,17,14,0,0)}
		checkout_at {DateTime.new(2022,2,17,15,0,0)}
		user_id {1}
	end

end