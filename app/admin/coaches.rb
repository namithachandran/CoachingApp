
ActiveAdmin.register Coach do
    permit_params :name, :email, :bio, :password, :password_confirmation
  
    form do |f|
      f.inputs do
        f.input :name
        f.input :email
        f.input :bio
        f.input :password
        f.input :password_confirmation
      end
      f.actions
    end
  end
  