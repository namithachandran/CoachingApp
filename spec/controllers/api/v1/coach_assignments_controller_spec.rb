require 'rails_helper'

RSpec.describe Api::V1::CoachAssignmentsController, type: :controller do
  let(:coaching_program) { create(:coaching_program) }
  let(:coach) { create(:coach) }
  let(:valid_params) { { coaching_program_id: coaching_program.id, coach_assignment: { coach_id: coach.id } } }
  let(:invalid_params) { { coaching_program_id: coaching_program.id, coach_assignment: { coach_id: nil } } }

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new coach assignment' do
        expect {
          post :create, params: valid_params
        }.to change(CoachAssignment, :count).by(1)

        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)['message']).to eq('Coach assigned successfully')
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new coach assignment and returns errors' do
        expect {
          post :create, params: invalid_params
        }.to_not change(CoachAssignment, :count)

        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)['errors']).to include("Coach must exist")
      end
    end
  end
end
