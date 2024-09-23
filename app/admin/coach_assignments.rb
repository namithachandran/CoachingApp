
ActiveAdmin.register CoachAssignment do
    permit_params :coach_id, :coaching_program_id
  
    form do |f|
      f.inputs do
        f.input :coach
        f.input :coaching_program
      end
      f.actions
    end
  end
  