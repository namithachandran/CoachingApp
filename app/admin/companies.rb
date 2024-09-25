ActiveAdmin.register Company do
  permit_params :name, :description

  
  index do
    id_column
    column :name
    column :description

    column "Actions" do |company|
      link_to 'Go to Company Dashboard', company_path(company.id), class: 'btn btn-primary'
    end

    actions
  end
end
  