require 'rails_helper'

describe 'Wines API' do
  context 'GET /api/v1/wines.json' do
    it 'returns all wines' do
      create_list(:wine, 10)

      get '/api/v1/wine.json'
      
      expect(response).to be_success
      
      wines = JSON.parse(response.body)

      expect(wines.count).to eq(10)
    end
  end

end
