ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :avatar, :name, :roles

  index do
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions
  end

  filter :email

  form multipart: true do |f|
    f.semantic_errors :user
    f.inputs "Admin Details" do
      f.input :email
      f.input :name
      f.input :password
      f.input :password_confirmation
      f.input :avatar
      f.input :roles
    end
    f.actions
  end


end
