require 'rails_helper'
RSpec.describe 'Account Activations', type: :request do
  
  describe 'POST/sessions' do

    context 'when account is not activated' do
      let(:user) { User.create(name: 'Andreea', email: 'andreeaiulia@gmail.com', password: '123456', password_confirmation: '123456')}
      
      it 'redirect to main page with warning' do
        post login_path, params: {session: { email: user.email, password: user.password }}
        
        expect(response).to redirect_to root_path 
        follow_redirect!
        
        expect(response.body).to include('Account not activated.Check your email for the activation link')
        
        user.delete
      end
    end

    context 'when account is activated' do 
      let(:user) { User.create(name: 'Andreea', email: 'andreaexample11@gmail.com', password: '123456', password_confirmation: '123456', activated: true, activated_at: Time.now )}
     
      it 'redirect to user profile' do
        post login_path, params: {session: { email: user.email, password: user.password }}
        
        expect(response).to redirect_to "/users/#{user.id}"
        
        user.delete
      end
    end
  end
end