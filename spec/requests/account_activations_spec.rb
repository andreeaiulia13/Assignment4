require 'rails_helper'

RSpec.describe 'AccountActivationsController', type: :request do
  let(:user) { create :user }

  describe 'POST/sessions' do
    subject { post login_path, params: { session: { email: user.email, password: user.password }}}
    
    context 'when account is not activated' do
      it 'redirect to main page with warning' do
        expect(subject).to redirect_to root_path 
        
        follow_redirect!
        expect(response.body).to include('Account not activated.Check your email for the activation link')
      end
    end
    
    context 'when account is activated' do
      it 'redirect to user profile' do
        user.update_columns(activated: true, activated_at: Time.zone.now)

        expect(subject).to redirect_to "/users/#{user.id}"
      end
    end
  end
end
