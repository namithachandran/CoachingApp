
ActiveAdmin.register CoachingProgram do
    permit_params :title, :description, :start_date, :end_date, :company_id
  
    form do |f|
      f.inputs do
        f.input :company
        f.input :title
        f.input :description
        f.input :start_date, as: :datepicker
        f.input :end_date, as: :datepicker
      end
      f.actions
    end
  end
  