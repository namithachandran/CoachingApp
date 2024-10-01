require 'rails_helper'

RSpec.describe Api::V1::CompaniesController, type: :controller do
  describe 'GET #show' do
    let!(:company) { create(:company) }
    let!(:coaching_program) { create(:coaching_program, company: company) }

    before do
      allow(Company).to receive(:find).and_return(company)
    end

    it 'returns the company with associated coaching programs' do
      get :show, params: { id: company.id }

      expect(response).to have_http_status(:success)
      expect(response.content_type).to include('application/json')
      
      json_response = JSON.parse(response.body)
      expect(json_response['id']).to eq(company.id)
      expect(json_response['coaching_programs'].first['id']).to eq(coaching_program.id)
    end

    it 'calls the set_company method' do
      expect(controller).to receive(:set_company)
      get :show, params: { id: company.id }
    end

    it 'renders json including coaching programs' do
      get :show, params: { id: company.id }
      
      json_response = JSON.parse(response.body)
      expect(json_response['coaching_programs']).not_to be_empty
    end
  end
end
