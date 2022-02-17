require 'rails_helper'

RSpec.describe 'Visits', type: :request do

	before(:all) do 
		@user = User.create!(name: 'Jani', password: 'jane42', password_confirmation: 'jane42', email: 'jane@gmail.com', cpf: '34578954673')
		@visit = Visit.create!(:date => Date.new(2022,2,17), :status => "TRABALHANDO", :checkin_at => DateTime.new(2022,2,17,6,0,0), :checkout_at => DateTime.new(2022,2,17,15,0,0), :user_id => "#{@user.id}")
	end

	describe '#index' do

		it 'when the user is authenticated' do
			authentication = AuthenticateUser.call(@user.email, @user.password)
			get '/visits', headers: {"Authorization" => "Bearer #{authentication.result}"}
			expect(response).to be_successful
			expect(response).to have_http_status(200)
		end

		it 'when the user is not authenticated' do
			get '/visits'
			expect(response).to have_http_status(401)
		end
	end

	describe '#create' do

		it 'when the visit is created' do
			authentication = AuthenticateUser.call(@user.email, @user.password)
			post '/visits', params: {:date => Date.new(2022,2,17), :status => 'TRABALHANDO', :checkin_at => DateTime.new(2022,2,17,7,0,0), :checkout_at => DateTime.new(2022,2,17,14,0,0), :user_id => "#{@user.id}" },  headers: {"Authorization" => "Bearer #{authentication.result}"}
			expect(response).to have_http_status(201)
		end

		it 'when the visit is not created' do
			authentication = AuthenticateUser.call(@user.email, @user.password)
			post '/visits', params: {:date => Date.new(2009,2,16), :status => 'TRABALHANDO', :checkin_at => DateTime.new(2022,2,17,7,0,0), :checkout_at => DateTime.new(2022,2,17,14,0,0), :user_id => "#{@user.id}" },  headers: {"Authorization" => "Bearer #{authentication.result}"}
			expect(response).to have_http_status(422)
		end

		it 'when the visit is not created: invalid param' do
			authentication = AuthenticateUser.call(@user.email, @user.password)
			post '/visits', params: {:date => "teste", :status => 'TRABALHANDO', :checkin_at => DateTime.new(2022,2,17,4,0,0), :checkout_at => DateTime.new(2022,2,17,10,0,0), :user_id => "#{@user.id}" },  headers: {"Authorization" => "Bearer #{authentication.result}"}
			expect(response).to have_http_status(422)
		end
	end

	describe '#update' do
		it 'when the visit is updated' do 
			authentication = AuthenticateUser.call(@user.email, @user.password)
			put "/visits/#{@user.id}", params: {:status => 'TRABALHANDO' },  headers: {"Authorization" => "Bearer #{authentication.result}"}
			@visit.reload
			expect(response).to have_http_status(200)
		end

		it 'when the visit is not updated: invalid param' do 
			authentication = AuthenticateUser.call(@user.email, @user.password)
			put "/visits/#{@user.id}", params: {:status => 12 },  headers: {"Authorization" => "Bearer #{authentication.result}"}
			@visit.reload
			expect(response).to have_http_status(422)
		end

		it 'when the user is not authenticated' do
			put "/visits/#{@user.id}"
			expect(response).to have_http_status(401)
		end
	end

	describe '#delete' do 

		it 'when the visit is deleted' do
			authentication = AuthenticateUser.call(@user.email, @user.password)
			delete "/visits/#{@visit.id}", headers: {"Authorization" => "Bearer #{authentication.result}"}
			expect(response).to have_http_status(204)
		end

		it 'when the user is not authenticated' do
			delete "/visits/#{@visit.id}"
			expect(response).to have_http_status(401)
		end
	end
end