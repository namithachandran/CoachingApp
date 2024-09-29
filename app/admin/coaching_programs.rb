
ActiveAdmin.register CoachingProgram do
    permit_params :title, :description, :start_date, :end_date, :company_id, :coaches, coach_ids: []

    index do
      selectable_column
      id_column
      column :company
      column :title
      column :description
      column :start_date
      column :end_date
      actions
    end
    form do |f|
      f.inputs do
        f.input :company
        f.input :title
        f.input :description
        f.input :coaches, as: :check_boxes, collection: Coach.all
        f.input :start_date, as: :datepicker
        f.input :end_date, as: :datepicker
      end
      f.actions
    end
  end
  
  