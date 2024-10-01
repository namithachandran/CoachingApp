require 'rails_helper'

RSpec.describe Api::V1::CoachDashboardController, type: :controller do
  let(:coach) { create(:coach) }
  let(:coaching_program_1) { create(:coaching_program) }
  let(:coaching_program_2) { create(:coaching_program) }
  let(:employee) { create(:employee) }

  before do
    allow(controller).to receive(:authenticate_coach!).and_return(true)
  end

  describe 'GET #index' do
    context 'when the coach is found' do
      context 'and has coaching programs with enrollments' do
        before do
          create(:employee_enrollment, employee: employee, coaching_program: coaching_program_1)
          create(:employee_enrollment, employee: employee, coaching_program: coaching_program_2)
        end

        it 'returns a successful response with coaching programs and employee count' do
          get :index, params: { coach_id: coach.id }

          expect(response).to have_http_status(:ok)
          json_response = JSON.parse(response.body)
          expect(json_response.size).to eq(2)

          first_program = json_response.first
          expect(first_program['id']).to eq(coaching_program_1.id)
          expect(first_program['employees_count']).to eq(1)
        end
      end

      context 'and has no employee enrollments' do
        before do
          coaching_program_1
          coaching_program_2
        end

        it 'returns a successful response with coaching programs and zero employees count' do
          get :index, params: { coach_id: coach.id }

          expect(response).to have_http_status(:ok)
          json_response = JSON.parse(response.body)
          expect(json_response.size).to eq(2)

          first_program = json_response.first
          expect(first_program['id']).to eq(coaching_program_1.id)
          expect(first_program['employees_count']).to eq(0)
        end
      end
    end

    context 'when the coach is not found' do
      it 'returns a not found response' do
        expect {
          get :index, params: { coach_id: 999 }
        }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
