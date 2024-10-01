require 'rails_helper'

RSpec.describe Api::V1::EmployeeEnrollmentsController, type: :controller do
  let!(:employee) { create(:employee) }
  let!(:coaching_program) { create(:coaching_program) }
  
  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new employee enrollment' do
        expect {
          post :create, params: { employee_id: employee.id, program_id: coaching_program.id }
        }.to change(EmployeeEnrollment, :count).by(1)
      end

      it 'returns a successful response with a message' do
        post :create, params: { employee_id: employee.id, program_id: coaching_program.id }
        json_response = JSON.parse(response.body)
        
        expect(response).to have_http_status(:created)
        expect(json_response['message']).to eq('Enrollment successful')
        expect(json_response['enrollment']['employee_id']).to eq(employee.id)
        expect(json_response['enrollment']['coaching_program_id']).to eq(coaching_program.id)
      end
    end

    context 'when employee or coaching program is not found' do
      it 'raises an ActiveRecord::RecordNotFound error for employee' do
        expect {
          post :create, params: { employee_id: 0, program_id: coaching_program.id } 
        }.to raise_error(ActiveRecord::RecordNotFound)
      end

      it 'raises an ActiveRecord::RecordNotFound error for coaching program' do
        expect {
          post :create, params: { employee_id: employee.id, program_id: 0 } 
        }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
