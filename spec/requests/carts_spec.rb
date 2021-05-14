require 'rails_helper'

RSpec.describe "Carts", type: :request do
  
  describe 'GET/carts/show' do 
    context 'when user not logged in' do
      it 'redirect to login page' do
        get carts_show_path
        expect(response).to redirect_to login_path
      end
    end
  end
  
end

