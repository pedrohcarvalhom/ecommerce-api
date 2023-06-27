require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  controller do
    before_action :authenticate_costumer

    def show
      #
    end
  end

  before do
    routes.draw { get 'show' => 'anonymous#show' }
  end

  describe '#authenticate_costumer' do
    let(:costumer) { create(:costumer) }

    context 'given a valid token and the costumer exists' do
      it 'returns the current costumer' do
        request.headers['Authorization'] = "Bearer #{costumer.token}"
        get :show

        expect(response).to have_http_status(:no_content)
      end
    end

    context 'when no token is given' do
      it 'returns a Security Error' do
        request.headers['Authorization'] = "Bearer invalid"
        get :show

        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
